{% extends '//lib/llvm/t/ix.sh' %}

{% block bld_libs %}
lib/kernel
lib/c/naked
lib/shim/alloc
{% if sanitize %}
lib/build/sanitize/hack_cmake
{% endif %}
lib/compiler_rt/builtins/hack/ish
{% endblock %}

{% block cmake_flags %}
{{super()}}
LLVM_ENABLE_RUNTIMES="compiler-rt"
LLVM_BINARY_DIR="${out}/lib/cmake"
{% endblock %}

{% block cmake_srcdir %}
runtimes
{% endblock %}

{% block ninja_targets %}
compiler-rt
{% endblock %}

{% block ninja_install_targets %}
install-compiler-rt
{% endblock %}
