{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/videolan/dav1d/archive/refs/tags/1.5.0.tar.gz
sha:78b15d9954b513ea92d27f39362535ded2243e1b0924fde39f37a31ebed5f76b
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
