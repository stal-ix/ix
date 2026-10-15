/*
 * wasm-decode: a loader for the pure decode.wasm on WAMR.
 *
 *   wasm-decode decode.wasm image -o out.rgba
 *   wasm-decode decode.wasm image width height tolerance ref.rgba
 *
 * Instantiates the module, puts the file and its name into its memory
 * through the exported malloc, calls decode(ptr, len, name, name_len),
 * reads the result block
 * {u32 width, u32 height, rgba[]} back out of linear memory. Then does it
 * a second time in the same instance and requires the same pixels, which
 * is what reusing an instance across images relies on.
 *
 * Exit codes: 0 ok, 1 decode() returned NULL, 2 pixels differ from the
 * reference, 3 the module trapped, 4 loader or argument error.
 */

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include "wasm_export.h"

static double now_ms(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return ts.tv_sec * 1e3 + ts.tv_nsec / 1e6;
}

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

struct decoded {
    uint32_t width;
    uint32_t height;
    uint32_t pixels;  // app offset of the rgba bytes
    uint32_t block;   // app offset of the whole result, for free()
};

/* One decode() round trip. Returns 0 ok, 1 NULL, 3 trap, 4 bad result. */
static int decode_once(wasm_module_inst_t inst, wasm_exec_env_t env, const uint8_t *data, size_t len, const char *name, struct decoded *out) {
    wasm_function_inst_t f_malloc = wasm_runtime_lookup_function(inst, "malloc");
    wasm_function_inst_t f_decode = wasm_runtime_lookup_function(inst, "decode");
    wasm_function_inst_t f_free = wasm_runtime_lookup_function(inst, "free");

    if (!f_malloc || !f_decode || !f_free) {
        fprintf(stderr, "wasm-decode: module lacks malloc/decode/free\n");
        return 4;
    }

    size_t name_len = strlen(name);
    uint32_t args[4] = {(uint32_t) (len + name_len), 0, 0, 0};

    if (!wasm_runtime_call_wasm(env, f_malloc, 1, args)) {
        fprintf(stderr, "wasm-decode: trap in malloc: %s\n", wasm_runtime_get_exception(inst));
        return 3;
    }

    uint32_t in = args[0];

    if (!in || !wasm_runtime_validate_app_addr(inst, in, len + name_len)) {
        fprintf(stderr, "wasm-decode: malloc(%zu) failed\n", len + name_len);
        return 4;
    }

    // the file, then its name right behind it, in one allocation
    memcpy(wasm_runtime_addr_app_to_native(inst, in), data, len);
    memcpy((uint8_t *) wasm_runtime_addr_app_to_native(inst, in) + len, name, name_len);

    args[0] = in;
    args[1] = (uint32_t) len;
    args[2] = in + (uint32_t) len;
    args[3] = (uint32_t) name_len;

    if (!wasm_runtime_call_wasm(env, f_decode, 4, args)) {
        fprintf(stderr, "wasm-decode: trap: %s\n", wasm_runtime_get_exception(inst));
        return 3;
    }

    uint32_t res = args[0];

    args[0] = in;
    wasm_runtime_call_wasm(env, f_free, 1, args);

    if (!res) {
        return 1;
    }

    if (!wasm_runtime_validate_app_addr(inst, res, 8)) {
        fprintf(stderr, "wasm-decode: result header out of memory\n");
        return 4;
    }

    const uint32_t *hdr = wasm_runtime_addr_app_to_native(inst, res);
    out->width = hdr[0];
    out->height = hdr[1];
    out->block = res;
    out->pixels = res + 8;

    uint64_t bytes = (uint64_t) out->width * out->height * 4;

    if (!out->width || !out->height || bytes > 0xffffffffu || !wasm_runtime_validate_app_addr(inst, out->pixels, (uint32_t) bytes)) {
        fprintf(stderr, "wasm-decode: result pixels out of memory (%ux%u)\n", out->width, out->height);
        return 4;
    }

    return 0;
}

static void release(wasm_module_inst_t inst, wasm_exec_env_t env, uint32_t block) {
    uint32_t args[1] = {block};
    wasm_runtime_call_wasm(env, wasm_runtime_lookup_function(inst, "free"), 1, args);
}

int main(int argc, char **argv) {
    if (argc != 5 && argc != 7) {
        fprintf(stderr, "usage: wasm-decode module.wasm image -o out.rgba\n"
                        "       wasm-decode module.wasm image width height tolerance ref.rgba\n");
        return 4;
    }

    size_t mod_len, img_len;
    uint8_t *mod = slurp(argv[1], &mod_len);
    uint8_t *img = slurp(argv[2], &img_len);

    if (!mod || !img) {
        fprintf(stderr, "wasm-decode: cannot read inputs\n");
        return 4;
    }

    const char *name = strrchr(argv[2], '/');
    name = name ? name + 1 : argv[2];

    char err[256];

    // the fast JIT keeps its code in a cache of fixed size; the default
    // 10 MB is less than this module's code
    RuntimeInitArgs init_args;
    memset(&init_args, 0, sizeof(init_args));
    init_args.mem_alloc_type = Alloc_With_System_Allocator;
    init_args.fast_jit_code_cache_size = 512u << 20;

    if (!wasm_runtime_full_init(&init_args)) {
        fprintf(stderr, "wasm-decode: runtime init failed\n");
        return 4;
    }

    wasm_module_t module = wasm_runtime_load(mod, (uint32_t) mod_len, err, sizeof(err));

    if (!module) {
        fprintf(stderr, "wasm-decode: load: %s\n", err);
        return 4;
    }

    // 0 bytes of runtime heap: the module manages its own memory
    wasm_module_inst_t inst = wasm_runtime_instantiate(module, 1 << 20, 0, err, sizeof(err));

    if (!inst) {
        fprintf(stderr, "wasm-decode: instantiate: %s\n", err);
        return 4;
    }

    wasm_exec_env_t env = wasm_runtime_create_exec_env(inst, 16 << 20);

    struct decoded a;
    double t0 = now_ms();
    int rc = decode_once(inst, env, img, img_len, name, &a);
    double t1 = now_ms();

    if (rc) {
        return rc;
    }

    size_t bytes = (size_t) a.width * a.height * 4;
    uint8_t *first = malloc(bytes);
    memcpy(first, wasm_runtime_addr_app_to_native(inst, a.pixels), bytes);
    release(inst, env, a.block);

    // the same instance again: the second decode must see an initialized
    // module and produce the same pixels
    struct decoded b;
    double t2 = now_ms();
    rc = decode_once(inst, env, img, img_len, name, &b);
    double t3 = now_ms();

    fprintf(stderr, "decode: first %.0f ms, second %.0f ms\n", t1 - t0, t3 - t2);

    if (rc) {
        fprintf(stderr, "wasm-decode: second decode in the same instance failed (%d)\n", rc);
        return rc;
    }

    if (b.width != a.width || b.height != a.height || memcmp(first, wasm_runtime_addr_app_to_native(inst, b.pixels), bytes) != 0) {
        fprintf(stderr, "wasm-decode: second decode in the same instance differs\n");
        return 2;
    }

    release(inst, env, b.block);

    if (argc == 5) {
        FILE *o = fopen(argv[4], "wb");

        if (!o || fwrite(first, 1, bytes, o) != bytes) {
            fprintf(stderr, "wasm-decode: cannot write %s\n", argv[4]);
            return 4;
        }

        fclose(o);
        printf("%ux%u\n", a.width, a.height);
        return 0;
    }

    uint32_t width = (uint32_t) strtoul(argv[3], NULL, 10);
    uint32_t height = (uint32_t) strtoul(argv[4], NULL, 10);
    int tolerance = atoi(argv[5]);
    size_t ref_len;
    uint8_t *ref = slurp(argv[6], &ref_len);

    if (!ref) {
        fprintf(stderr, "wasm-decode: cannot read %s\n", argv[6]);
        return 4;
    }

    if (a.width != width || a.height != height) {
        fprintf(stderr, "wasm-decode: got %ux%u, reference is %ux%u\n", a.width, a.height, width, height);
        return 2;
    }

    if (ref_len != bytes) {
        fprintf(stderr, "wasm-decode: reference has %zu bytes, expected %zu\n", ref_len, bytes);
        return 4;
    }

    int worst = 0;
    size_t over = 0;

    for (size_t i = 0; i < bytes; i++) {
        int d = abs((int) first[i] - (int) ref[i]);

        if (d > worst) {
            worst = d;
        }

        if (d > tolerance) {
            over++;
        }
    }

    printf("%ux%u max diff %d, %zu bytes over tolerance %d\n", a.width, a.height, worst, over, tolerance);

    return over ? 2 : 0;
}
