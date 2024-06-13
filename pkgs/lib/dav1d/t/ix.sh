{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/videolan/dav1d/archive/refs/tags/1.4.3.tar.gz
sha:88a023e58d955e0886faf49c72940e0e90914a948a8e60c1326ce3e09e7a6099
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
