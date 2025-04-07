{% extends '//lib/llvm/19/ix.sh' %}

{% block bld_libs %}
lib/c
lib/c++
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}
{% endblock %}

{% block cmake_flags %}
{{super()}}
LLVM_ENABLE_PROJECTS="clang;clang-tools-extra"
{% endblock %}

{% block ninja_build_targets %}
clangd
{% endblock %}

{% block ninja_install_targets %}
install-clangd
{% endblock %}

{% block postinstall %}
:
{% endblock %}
