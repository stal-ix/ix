{% extends '//bin/iwasm/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/asmjit
lib/llvm/15
{% endblock %}

{% block cmake_flags %}
{{super()}}
LLVM_DIR=/xxx
WAMR_BUILD_JIT=1
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
sed -e 's|.*add_subdirectory.*||' -i ../../../core/iwasm/fast-jit/iwasm_fast_jit.cmake
{% endblock %}
