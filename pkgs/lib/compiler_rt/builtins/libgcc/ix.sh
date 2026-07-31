{% extends '//lib/compiler_rt/builtins/hack/pic/ix.sh' %}

# Freestanding compiler-rt builtins exposed under the name `libgcc.a` so glibc's
# hardcoded `-lgcc` (gnulib / libc.so-gnulib) resolves to them. Pure arithmetic
# helpers with no libc dependency, so linking them into the shared libc.so/rtld
# introduces no cycle. hack/pic keeps lib/c/naked in bld_libs (not lib_deps), so
# it does not propagate into consumers like glibc.

# LLVM 13's soft-float quad builtins (__addtf3 ...) are gated on a 128-bit long
# double, so they are disabled on x86_64 (80-bit long double) — but glibc needs
# them for _Float128. LLVM 21 decoupled this (CRT_HAS_TF_MODE / __float128), so
# build the builtins from the LLVM 21 source instead.
{% block fetch %}
{% include '//lib/llvm/21/ver.sh' %}
{% endblock %}

# Drop the non-freestanding builtins (they pull libc/system headers a freestanding
# libgcc must not need, and glibc uses none of them); rm -f keeps this robust across
# compiler-rt versions. crtbegin/crtend are kept — glibc links them into its own
# programs via `clang --print-file-name=crtbeginS.o`. int_util.c (which defines
# __compilerrt_abort_impl) needs <stdlib.h>, so replace it with a tiny freestanding
# stub that calls abort() (resolved from glibc at link).
{% block patch %}
{{super()}}
for f in clear_cache cpu_model emutls enable_execute_stack \
         eprintf gcc_personality_v0 int_util os_version_check; do
    rm -f lib/builtins/${f}.c
done

cat > lib/builtins/ix_compilerrt_abort.c << 'EOF'
extern void abort(void);
void __compilerrt_abort_impl(const char *file, int line, const char *function) {
    (void)file;
    (void)line;
    (void)function;
    abort();
}
EOF

# compiler-rt's __divxc3 (complex long double divide, which clang emits where gcc
# inlines) uses fmaxl/logbl for overflow-safe scaling — libm functions absent from
# libc.so. Replace it with a naive scaling-free divide so no libm is needed.
rm -f lib/builtins/divxc3.c
cat > lib/builtins/ix_divxc3.c << 'EOF'
long double _Complex __divxc3(long double a, long double b, long double c, long double d) {
    long double denom = c * c + d * d;
    long double _Complex z;
    __real__ z = (a * c + b * d) / denom;
    __imag__ z = (b * c - a * d) / denom;
    return z;
}
EOF

# glibc's x86 soft-fp _Float128 ops (e_sqrtf128 ...) call __sfp_handle_exceptions,
# a GCC libgcc symbol compiler-rt lacks. The glibc FP_EX_* bits match the x86 MXCSR
# exception flags 1:1, so just OR them into MXCSR (sticky flags for fetestexcept).
cat > lib/builtins/ix_sfp_exceptions.c << 'EOF'
#if defined(__x86_64__) || defined(__i386__)
void __sfp_handle_exceptions(int x) {
    unsigned int mxcsr;
    __asm__ __volatile__("stmxcsr %0" : "=m"(mxcsr));
    mxcsr |= (unsigned int)(x & 0x3f);
    __asm__ __volatile__("ldmxcsr %0" : : "m"(mxcsr));
}
#endif
EOF
{% endblock %}

# Compile with the raw clang (FREESTANDING_CLANG), not the cc wrapper: the wrapper
# bakes ${CPPFLAGS} (carrying -fno-pic -fno-pie from the naked-libc env) after our
# args. Here -fPIC rides last so it wins — these objects go into the shared
# libc.so and must be PIC. Only clang's own resource headers are needed.
{% block build %}
for x in lib/builtins/*.c; do
    ${FREESTANDING_CLANG} \
        -Wno-unused-command-line-argument \
        --target={{target.arch}}-{{target.vendor}}-{{target.clang_os}} \
        -isystem${CLANG_HEADERS} \
        ${CPPFLAGS} ${CFLAGS} \
        -fPIC -c ${x}
done

# crtbegin/crtend are standalone CRT objects, not archive members: move them out
# of the glob (compiled -fPIC, so they are the shared "S" variant glibc wants).
mkdir crt
mv crtbegin.o crt/crtbeginS.o
mv crtend.o crt/crtendS.o

ar qs libcompiler_rt.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp libcompiler_rt.a ${out}/lib/libgcc.a
cp crt/crtbeginS.o crt/crtendS.o ${out}/lib/
{% endblock %}

# glibc finds the CRT objects for its programs via `clang --print-file-name`, which
# searches -B dirs; point it at our lib dir.
{% block env %}
export CFLAGS="-B${out}/lib ${CFLAGS}"
{% endblock %}
