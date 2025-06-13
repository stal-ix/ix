{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
openh264
{% endblock %}

{% block version %}
2.6.0
{% endblock %}

{% block fetch %}
https://github.com/cisco/openh264/archive/refs/tags/v{{self.version().strip()}}.tar.gz
558544ad358283a7ab2930d69a9ceddf913f4a51ee9bf1bfb9e377322af81a69
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/nasm
{% endblock %}
