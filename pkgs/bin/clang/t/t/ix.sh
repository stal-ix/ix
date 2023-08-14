{% extends '//lib/llvm/t/heavy/ix.sh' %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/kernel
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}
{% endblock %}

{% block cmake_flags %}
{{super()}}
LLVM_ENABLE_TERMINFO=OFF
LLVM_ENABLE_PROJECTS="clang;lld;polly"
CLANG_ENABLE_STATIC_ANALYZER=OFF
CLANG_ENABLE_ARCMT=OFF
{% endblock %}

{% block cmake_srcdir %}
llvm
{% endblock %}

{% set targets %}
{% block llvm_targets %}
{% endblock %}
{% endset %}

{% block ninja_build_targets %}
{{targets}}
{% endblock %}

{% block ninja_install_targets %}
{% for t in ix.parse_list(targets) %}
install-{{t}}
{% endfor %}
{% endblock %}
