/*
 * wasm-page: a loader on WAMR for a pure module with the page ABI, the
 * one lib/pdf/ium/wasm and lib/djvulibre/wasm export under their prefix:
 *
 *   <prefix>_open(data, len) -> doc | 0
 *   <prefix>_pages(doc) -> count
 *   <prefix>_width(doc, page) -> points | 0
 *   <prefix>_height(doc, page) -> points | 0
 *   <prefix>_render(doc, page, width, height) -> {u32 w, u32 h, rgba[]} | 0
 *   <prefix>_close(doc)
 *
 *   wasm-page module.wasm prefix file page width height out.rgba
 *
 * Instantiates the module, puts the file into its memory through the
 * exported malloc, opens it, prints the page count and the page's size
 * in points, renders the page at width by height, writes the RGBA out
 * and prints how many of its pixels are not white. Then renders the same
 * page again in the same instance and requires the same pixels, which is
 * what reusing an instance across pages relies on.
 *
 * Exit codes: 0 ok, 1 the module returned 0, 2 the renders differ, 3 the
 * module trapped, 4 loader or argument error.
 */

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "wasm_export.h"

static uint8_t *slurp(const char *path, size_t *size) {
    FILE *f = fopen(path, "rb");

    if (!f) {
        return NULL;
    }

    fseek(f, 0, SEEK_END);
    long n = ftell(f);
    rewind(f);

    uint8_t *buf = malloc(n > 0 ? (size_t) n : 1);

    if (n > 0 && fread(buf, 1, (size_t) n, f) != (size_t) n) {
        fclose(f);
        free(buf);
        return NULL;
    }

    fclose(f);
    *size = (size_t) n;
    return buf;
}

static wasm_module_inst_t inst;
static wasm_exec_env_t env;
static const char *prefix;

static wasm_function_inst_t function(const char *name) {
    wasm_function_inst_t f = wasm_runtime_lookup_function(inst, name);

    if (!f) {
        fprintf(stderr, "wasm-page: module lacks %s\n", name);
        exit(4);
    }

    return f;
}

/* the module's own account of a trap, when it exports <prefix>_error */
static void explain(void) {
    char name[64];

    snprintf(name, sizeof(name), "%s_error", prefix);

    wasm_function_inst_t f = wasm_runtime_lookup_function(inst, name);
    uint32_t args[1] = {0};

    // the trap is still set on the instance; the runtime refuses calls
    // until it is cleared, and the module's memory is still readable
    wasm_runtime_clear_exception(inst);

    if (!f) {
        return;
    }

    if (!wasm_runtime_call_wasm(env, f, 0, args)) {
        fprintf(stderr, "wasm-page: %s failed too: %s\n", name, wasm_runtime_get_exception(inst));
        return;
    }

    if (!args[0] || !wasm_runtime_validate_app_addr(inst, args[0], 1)) {
        fprintf(stderr, "wasm-page: %s points outside the memory\n", name);
        return;
    }

    const char *cause = wasm_runtime_addr_app_to_native(inst, args[0]);

    fprintf(stderr, "wasm-page: the module says: %.200s\n", *cause ? cause : "(nothing)");
}

/* calls name with the arguments, which it overwrites with the result */
static void call(const char *name, uint32_t *args, unsigned count) {
    if (!wasm_runtime_call_wasm(env, function(name), count, args)) {
        fprintf(stderr, "wasm-page: trap in %s: %s\n", name, wasm_runtime_get_exception(inst));
        explain();
        exit(3);
    }
}

/* calls the module's <prefix>_<suffix> */
static void call_prefixed(const char *suffix, uint32_t *args, unsigned count) {
    char name[64];

    snprintf(name, sizeof(name), "%s_%s", prefix, suffix);
    call(name, args, count);
}

static float as_float(uint32_t bits) {
    float f;

    memcpy(&f, &bits, 4);
    return f;
}

/* one render; returns the result block's app offset, 0 for a failure */
static uint32_t render(uint32_t doc, uint32_t page, uint32_t width, uint32_t height, uint8_t **pixels) {
    uint32_t args[4] = {doc, page, width, height};

    call_prefixed("render", args, 4);

    uint32_t res = args[0];

    if (!res) {
        return 0;
    }

    uint64_t bytes = 8 + (uint64_t) width * height * 4;

    if (bytes > 0xffffffffu || !wasm_runtime_validate_app_addr(inst, res, (uint32_t) bytes)) {
        fprintf(stderr, "wasm-page: result out of memory\n");
        exit(4);
    }

    const uint32_t *hdr = wasm_runtime_addr_app_to_native(inst, res);

    if (hdr[0] != width || hdr[1] != height) {
        fprintf(stderr, "wasm-page: result is %ux%u, asked %ux%u\n", hdr[0], hdr[1], width, height);
        exit(4);
    }

    *pixels = (uint8_t *) wasm_runtime_addr_app_to_native(inst, res + 8);
    return res;
}

static void release(uint32_t block) {
    uint32_t args[1] = {block};

    call("free", args, 1);
}

int main(int argc, char **argv) {
    if (argc != 8) {
        fprintf(stderr, "usage: wasm-page module.wasm prefix file page width height out.rgba\n");
        return 4;
    }

    size_t mod_len, doc_len;
    uint8_t *mod = slurp(argv[1], &mod_len);
    uint8_t *file = slurp(argv[3], &doc_len);

    prefix = argv[2];

    if (!mod || !file) {
        fprintf(stderr, "wasm-page: cannot read inputs\n");
        return 4;
    }

    uint32_t page = (uint32_t) strtoul(argv[4], NULL, 10);
    uint32_t width = (uint32_t) strtoul(argv[5], NULL, 10);
    uint32_t height = (uint32_t) strtoul(argv[6], NULL, 10);
    char err[256];

    // the fast JIT keeps its code in a cache of fixed size; the default
    // 10 MB is less than these modules' code
    RuntimeInitArgs init_args;
    memset(&init_args, 0, sizeof(init_args));
    init_args.mem_alloc_type = Alloc_With_System_Allocator;
    init_args.fast_jit_code_cache_size = 512u << 20;

    if (!wasm_runtime_full_init(&init_args)) {
        fprintf(stderr, "wasm-page: runtime init failed\n");
        return 4;
    }

    wasm_module_t module = wasm_runtime_load(mod, (uint32_t) mod_len, err, sizeof(err));

    if (!module) {
        fprintf(stderr, "wasm-page: load: %s\n", err);
        return 4;
    }

    // 0 bytes of runtime heap: the module manages its own memory
    inst = wasm_runtime_instantiate(module, 1 << 20, 0, err, sizeof(err));

    if (!inst) {
        fprintf(stderr, "wasm-page: instantiate: %s\n", err);
        return 4;
    }

    env = wasm_runtime_create_exec_env(inst, 16 << 20);

    uint32_t args[4] = {(uint32_t) doc_len, 0, 0, 0};

    call("malloc", args, 1);

    uint32_t in = args[0];

    if (!in || !wasm_runtime_validate_app_addr(inst, in, (uint32_t) doc_len)) {
        fprintf(stderr, "wasm-page: malloc(%zu) failed\n", doc_len);
        return 4;
    }

    memcpy(wasm_runtime_addr_app_to_native(inst, in), file, doc_len);

    args[0] = in;
    args[1] = (uint32_t) doc_len;
    call_prefixed("open", args, 2);

    uint32_t doc = args[0];

    if (!doc) {
        fprintf(stderr, "wasm-page: %s_open returned 0\n", prefix);
        return 1;
    }

    args[0] = doc;
    call_prefixed("pages", args, 1);

    uint32_t pages = args[0];

    args[0] = doc;
    args[1] = page;
    call_prefixed("width", args, 2);

    float points_w = as_float(args[0]);

    args[0] = doc;
    args[1] = page;
    call_prefixed("height", args, 2);

    float points_h = as_float(args[0]);

    uint8_t *pixels;
    uint32_t first = render(doc, page, width, height, &pixels);

    if (!first) {
        fprintf(stderr, "wasm-page: %s_render returned 0\n", prefix);
        return 1;
    }

    size_t bytes = (size_t) width * height * 4;
    uint8_t *copy = malloc(bytes);

    memcpy(copy, pixels, bytes);
    release(first);

    uint32_t second = render(doc, page, width, height, &pixels);

    if (!second) {
        fprintf(stderr, "wasm-page: the second render in the same instance returned 0\n");
        return 1;
    }

    if (memcmp(copy, pixels, bytes) != 0) {
        fprintf(stderr, "wasm-page: the second render in the same instance differs\n");
        return 2;
    }

    release(second);

    args[0] = doc;
    call_prefixed("close", args, 1);
    args[0] = in;
    call("free", args, 1);

    FILE *o = fopen(argv[7], "wb");

    if (!o || fwrite(copy, 1, bytes, o) != bytes) {
        fprintf(stderr, "wasm-page: cannot write %s\n", argv[7]);
        return 4;
    }

    fclose(o);

    size_t ink = 0;

    for (size_t i = 0; i < bytes; i += 4) {
        if (copy[i] != 255 || copy[i + 1] != 255 || copy[i + 2] != 255) {
            ink++;
        }
    }

    printf("pages %u, page %u is %.1fx%.1f points, %ux%u pixels, %zu with ink\n", pages, page, points_w, points_h, width, height, ink);
    return 0;
}
