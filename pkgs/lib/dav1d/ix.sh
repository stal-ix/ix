{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/videolan/dav1d/archive/refs/tags/1.1.0.tar.gz
sha:b163791a587c083803a3db2cd18b4fbaf7fb865b47d038c4869ffef7722b6b16
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/nasm
{% endblock %}

{% block meson_flags %}
enable_tools=false
enable_examples=false
enable_tests=false
{% endblock %}
