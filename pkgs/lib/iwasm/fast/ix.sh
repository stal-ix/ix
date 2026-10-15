{# libiwasm with the fast JIT: WAMR's own x86_64 code generator on asmjit,
   no LLVM. Same API as lib/iwasm, functions are compiled on first call. #}

{% extends '//lib/iwasm/ix.sh' %}

{# libiwasm.a references asmjit and the C++ runtime: link closure, so lib_deps #}
{% block lib_deps %}
lib/asm/jit
lib/c++
{% endblock %}

{% block cmake_flags %}
{{super()}}
WAMR_BUILD_FAST_JIT=1
FETCHCONTENT_FULLY_DISCONNECTED=ON
FETCHCONTENT_TRY_FIND_PACKAGE_MODE=ALWAYS
{% endblock %}

{% block configure %}
mkdir -p ${tmp}/obj/_deps/asmjit-src
{{super()}}
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*add_subdirectory.*||' -i core/iwasm/fast-jit/iwasm_fast_jit.cmake
{% endblock %}
