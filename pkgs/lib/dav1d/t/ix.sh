{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/videolan/dav1d/archive/refs/tags/1.4.0.tar.gz
sha:0b6d484fc3d20541a21403812499530b72875dee0ec88f682cb1d73943dfc156
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
