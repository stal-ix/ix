{% extends '//lib/compiler_rt/t/ix.sh' %}

{% block sanitizer_name %}
{{ix.error('The sanitizer_name block was supposed to be overriden but it wasn\'t')}}
{% endblock %}

{% block non_intercepted_symbols %}
{#
Some of the intercepted symbols will never be used in IX, or at least when building
with musl. These symbols should be listed here. For them, we create a fake `__real_XXX`
that does nothing, and remove the definition provided by the sanitizer.

The symbols listed in this parent template are used by all sanitizers and come from
`compiler-rt/lib/sanitizer_common/sanitizer_common_interceptors.inc`.
Child templates can add more.
#}
{# dlopen()/dlclose() are obviously not present in IX #}
dlopen
dlclose
{# pthread_mutexattr_getprioceiling() is present in POSIX, but not in musl #}
pthread_mutexattr_getprioceiling
{# pthread_mutexattr_getrobust_np() is a GNU extension, so not present in musl #}
pthread_mutexattr_getrobust_np
{# __b64_ntop()/__b64_pton() are not present in musl #}
__b64_ntop
__b64_pton
{% endblock %}

{% block patch %}
{{super()}}
{# Ignore any attempts to build shared sanitizers. #}
sed -i \
  '/function(add_compiler_rt_runtime name type)/a if(type MATCHES "^SHARED$")\n  return()\nendif()' \
  compiler-rt/cmake/Modules/AddCompilerRT.cmake

{# Convert `DoesNotSupportStaticLinking()` into a no-op, since we are going to use static linking anyway. #}
sed -i \
  '/volatile auto x = &kDynamic;/d' \
  compiler-rt/lib/interception/interception.h

{# Intercept the function at compile-time instead of run-time. #}
sed -i \
'
/#endif.*INTERCEPTION_LINUX_H/i\
#undef INTERCEPT_FUNCTION_LINUX_OR_FREEBSD\
#define INTERCEPT_FUNCTION_LINUX_OR_FREEBSD(func) (REAL(func) = &__real_##func)
' \
  compiler-rt/lib/interception/interception_linux.h

sed -i \
'
/# define DECLARE_REAL(ret_type, func, ...)            \\\|#  define DEFINE_REAL(ret_type, func, ...)            \\/a\
    extern "C" ret_type __real_##func(__VA_ARGS__); \\
' \
  compiler-rt/lib/interception/interception.h

{# With compile-time binding, dlsym() is not used and can be stubbed. #}
sed -i \
  '/SANITIZER_SOURCES_NOTERMINATION/a sanitizer_fake_dlsym.cpp' \
  compiler-rt/lib/sanitizer_common/CMakeLists.txt

cat << 'EOF' > compiler-rt/lib/sanitizer_common/sanitizer_fake_dlsym.cpp
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern "C"
void* dlsym(void* handle, const char* symbol) {
  // Called from `InitializeSwiftDemangler()` in `compiler-rt/lib/sanitizer_common/sanitizer_symbolizer_posix_libcdep.cpp`
  bool known_call = handle == nullptr && strcmp(symbol, "swift_demangle") == 0;
  if (!known_call) {
    fprintf(stderr, "dlsym() was not supposed to be called with %p:%s\n", handle, symbol);
    abort();
  }
  return nullptr;
}
EOF

{# `__dn_comp` is called `dn_comp` in musl. #}
sed -i \
  's/define DN_COMP_INTERCEPTOR_NAME __dn_comp/define DN_COMP_INTERCEPTOR_NAME dn_comp/' \
  compiler-rt/lib/sanitizer_common/sanitizer_common_interceptors.inc
{% endblock %}

{% block cmake_flags %}
{{super()}}
COMPILER_RT_BUILD_BUILTINS=OFF
COMPILER_RT_BUILD_SANITIZERS=ON
COMPILER_RT_BUILD_XRAY=OFF
COMPILER_RT_BUILD_LIBFUZZER=OFF
COMPILER_RT_BUILD_PROFILE=OFF
COMPILER_RT_BUILD_CTX_PROFILE=OFF
COMPILER_RT_BUILD_MEMPROF=OFF
COMPILER_RT_BUILD_ORC=OFF
COMPILER_RT_BUILD_GWP_ASAN=OFF
COMPILER_RT_SANITIZERS_TO_BUILD={{self.sanitizer_name()}}
{% endblock %}

{% block cpp_includes %}
{{super()}}
${PWD}/compiler-rt/include
{% endblock %}

{% block c_rename_symbol %}
dlsym
{% endblock %}

{% block env %}
export LDFLAGS="-resource-dir=${out} \${LDFLAGS}"
export IX_SANITIZER_INTERCEPT="${out}/lib/intercepted_symbols.txt"
{% for x in ix.parse_list(self.non_intercepted_symbols()) %}
export LDFLAGS="-Wl,--defsym=__real_{{x}}=0 \${LDFLAGS}"
{% endfor %}
{% endblock %}

{% block install %}
{{super()}}
mkdir -p ${out}/include
cp -R compiler-rt/include/sanitizer ${out}/include

{#
The sanitizer runtime will provide a definiton of `XXX` symbol (which is aliased
to `___interceptor_XXX`) for each intercepted `XXX`. With patches above,
`___interceptor_XXX` now depends on `__real_XXX`, which is the intercepted
function that is supposed to be provided by one of the dependencies
of the final linked binary.

Here, we collect all `XXX` symbols and save them in `intercepted_symbols.txt`
(taking care of the symbols listed in the `non_intercepted_symbols` block first),
so that we can later rename every intercepted `XXX` to `__real_XXX` in
the dependencies.
#}
(cat | sort -u | grep -v '^$') << 'EOF' > non_intercepted_symbols.txt
{{self.non_intercepted_symbols()}}
EOF

SANITIZER_LIB_PATTERN='*libclang_rt.{{self.sanitizer_name()}}-*.a'
find ${out}/lib -name ${SANITIZER_LIB_PATTERN} \
  | xargs llvm-nm -j \
  | sed -n '/^___interceptor_/{
    s/^___interceptor_//
    p
  }' \
  | sort -u \
  | grep -Fvx -f non_intercepted_symbols.txt \
  > intercepted_symbols.txt

{#
Make the `XXX` definitions provided by the sanitizer non-weak (so that they can't be accidentally
overriden), and remove the definitions we're not going to use.
#}
find ${out}/lib -name ${SANITIZER_LIB_PATTERN} | while read l
do
  llvm-objcopy \
    --strip-symbols=non_intercepted_symbols.txt \
    --globalize-symbols=intercepted_symbols.txt \
    ${l}
done

{# Any library that wants to define any of the intercepted symbols has to go through the redefiner. #}
mkdir -p ${out}/lib
mv intercepted_symbols.txt ${out}/lib/
{% endblock %}
