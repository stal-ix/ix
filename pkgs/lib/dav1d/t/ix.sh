{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/videolan/dav1d/archive/refs/tags/1.3.0.tar.gz
sha:1b3e75433dd69eb88ff3190ed1b1707ca5b9f43260b6348c551455c885eaab3a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/nasm
{% endblock %}

{% block meson_flags %}
enable_examples=false
enable_tests=false
{% endblock %}
