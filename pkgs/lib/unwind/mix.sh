{% extends '//lib/llvm/t/mix.sh' %}

{% block bld_libs %}
{% if target.os == 'linux' %}
lib/linux/mix.sh
{% endif %}
lib/c/naked/mix.sh
{% endblock %}

{% block std_box %}
box/boot/mix.sh
{% endblock %}

{% block cmake_flags %}
{{super()}}

LIBUNWIND_ENABLE_SHARED=NO
LIBUNWIND_ENABLE_STATIC=YES

LLVM_ENABLE_RUNTIMES="libunwind"
{% endblock %}

{% block cmake_srcdir %}
runtimes
{% endblock %}

{% block ninja_targets %}
unwind
{% endblock %}

{% block ninja_install_targets %}
install-unwind
{% endblock %}
