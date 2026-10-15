/*
 * wasm-mime: a loader on WAMR for a pure module with the MIME ABI, the
 * one lib/magic/wasm exports:
 *
 *   magic_mime(data, len) -> C string | 0
 *   magic_mime_error() -> C string | 0
 *
 *   wasm-mime module.wasm file
 *
 * Instantiates the module, puts the file into its memory through the
 * exported malloc, asks the type of the bytes and prints it, then asks
 * again in the same instance and requires the same answer, which is what
 * reusing an instance across files relies on.
 *
 * Exit codes: 0 ok, 1 the module returned 0, 2 the answers differ, 3 the
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

static wasm_function_inst_t function(const char *name) {
    wasm_function_inst_t f = wasm_runtime_lookup_function(inst, name);

    if (!f) {
        fprintf(stderr, "wasm-mime: module lacks %s\n", name);
        exit(4);
    }

    return f;
}

/* a C string the module points at, bounded by its memory */
static const char *string_at(uint32_t at) {
    if (!at) {
        return NULL;
    }

    uint32_t len = 0;

    while (wasm_runtime_validate_app_addr(inst, at + len, 1) && ((const char *) wasm_runtime_addr_app_to_native(inst, at))[len]) {
        if (++len == 4096) {
            fprintf(stderr, "wasm-mime: the answer does not end\n");
            exit(4);
        }
    }

    if (!wasm_runtime_validate_app_addr(inst, at + len, 1)) {
        fprintf(stderr, "wasm-mime: the answer runs out of the memory\n");
        exit(4);
    }

    return wasm_runtime_addr_app_to_native(inst, at);
}

/* the module's own account of its failure, when it has one */
static void explain(void) {
    wasm_function_inst_t f = wasm_runtime_lookup_function(inst, "magic_mime_error");
    uint32_t args[1] = {0};

    // after a trap the runtime refuses calls until the exception is
    // cleared; the module's memory is still readable
    wasm_runtime_clear_exception(inst);

    if (!f) {
        return;
    }

    if (!wasm_runtime_call_wasm(env, f, 0, args)) {
        fprintf(stderr, "wasm-mime: magic_mime_error failed too: %s\n", wasm_runtime_get_exception(inst));
        return;
    }

    const char *cause = string_at(args[0]);

    fprintf(stderr, "wasm-mime: the module says: %s\n", cause && *cause ? cause : "(nothing)");
}

/* calls name with the arguments, which it overwrites with the result */
static void call(const char *name, uint32_t *args, unsigned count) {
    if (!wasm_runtime_call_wasm(env, function(name), count, args)) {
        fprintf(stderr, "wasm-mime: trap in %s: %s\n", name, wasm_runtime_get_exception(inst));
        explain();
        exit(3);
    }
}

/* one answer, copied out: the module's string lives until its next call */
static char *ask(uint32_t data, uint32_t len) {
    uint32_t args[2] = {data, len};

    call("magic_mime", args, 2);

    const char *answer = string_at(args[0]);

    if (!answer) {
        fprintf(stderr, "wasm-mime: magic_mime returned 0\n");
        explain();
        exit(1);
    }

    return strdup(answer);
}

int main(int argc, char **argv) {
    if (argc != 3) {
        fprintf(stderr, "usage: wasm-mime module.wasm file\n");
        return 4;
    }

    size_t mod_len, file_len;
    uint8_t *mod = slurp(argv[1], &mod_len);
    uint8_t *file = slurp(argv[2], &file_len);

    if (!mod || !file) {
        fprintf(stderr, "wasm-mime: cannot read inputs\n");
        return 4;
    }

    if (file_len > 0xffffffffu) {
        fprintf(stderr, "wasm-mime: the file is too large for the module\n");
        return 4;
    }

    char err[256];

    // the fast JIT keeps its code in a cache of fixed size; the default
    // 10 MB is less than some modules' code
    RuntimeInitArgs init_args;
    memset(&init_args, 0, sizeof(init_args));
    init_args.mem_alloc_type = Alloc_With_System_Allocator;
    init_args.fast_jit_code_cache_size = 512u << 20;

    if (!wasm_runtime_full_init(&init_args)) {
        fprintf(stderr, "wasm-mime: runtime init failed\n");
        return 4;
    }

    wasm_module_t module = wasm_runtime_load(mod, (uint32_t) mod_len, err, sizeof(err));

    if (!module) {
        fprintf(stderr, "wasm-mime: load: %s\n", err);
        return 4;
    }

    // 0 bytes of runtime heap: the module manages its own memory
    inst = wasm_runtime_instantiate(module, 1 << 20, 0, err, sizeof(err));

    if (!inst) {
        fprintf(stderr, "wasm-mime: instantiate: %s\n", err);
        return 4;
    }

    env = wasm_runtime_create_exec_env(inst, 16 << 20);

    uint32_t args[2] = {(uint32_t) (file_len ? file_len : 1), 0};

    call("malloc", args, 1);

    uint32_t in = args[0];

    if (!in || !wasm_runtime_validate_app_addr(inst, in, (uint32_t) (file_len ? file_len : 1))) {
        fprintf(stderr, "wasm-mime: malloc(%zu) failed\n", file_len);
        return 4;
    }

    memcpy(wasm_runtime_addr_app_to_native(inst, in), file, file_len);

    char *first = ask(in, (uint32_t) file_len);
    char *second = ask(in, (uint32_t) file_len);

    if (strcmp(first, second) != 0) {
        fprintf(stderr, "wasm-mime: the second answer differs: %s, then %s\n", first, second);
        return 2;
    }

    printf("%s\n", first);
    return 0;
}
