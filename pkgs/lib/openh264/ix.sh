{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
openh264
{% endblock %}

{% block version %}
2.7.0
{% endblock %}

{% block fetch %}
https://github.com/cisco/openh264/archive/refs/tags/v{{self.version().strip()}}.tar.gz
5178775c8b440073e70920e97d195efff721c0e56d0a78cc82c919e95d54924d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/nasm
{% endblock %}
