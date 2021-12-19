{% extends '//lib/llvm/t/mix.sh' %}

{% block bld_libs %}
{% if target.os == 'linux' %}
lib/linux/mix.sh
{% endif %}
lib/c/no_rt/mix.sh
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
