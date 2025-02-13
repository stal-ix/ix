{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/cisco/openh264/archive/refs/tags/v2.6.0.tar.gz
sha:558544ad358283a7ab2930d69a9ceddf913f4a51ee9bf1bfb9e377322af81a69
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/nasm
{% endblock %}
