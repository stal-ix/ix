{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/cisco/openh264/archive/refs/tags/v2.4.0.tar.gz
sha:a44d1ccc348a790f9a272bba2d1c2eb9a9bbd0302e4e9b655d709e1c32f92691
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/nasm
{% endblock %}
