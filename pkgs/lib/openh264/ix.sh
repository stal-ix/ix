{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/cisco/openh264/archive/refs/tags/v2.4.1.tar.gz
sha:8ffbe944e74043d0d3fb53d4a2a14c94de71f58dbea6a06d0dc92369542958ea
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/nasm
{% endblock %}
