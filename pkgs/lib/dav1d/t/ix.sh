{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/videolan/dav1d/archive/refs/tags/1.2.0.tar.gz
sha:88669c6113ddfda068f03bf8e864e4e6a1ea2e2480afec86d1bf91a8c600e79d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/nasm
{% endblock %}

{% block meson_flags %}
enable_examples=false
enable_tests=false
{% endblock %}
