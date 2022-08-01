{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/cisco/openh264/archive/refs/tags/v2.3.0.tar.gz
sha:99b0695272bee73a3b3a5fcb1afef462c11a142d1dc35a2c61fef5a4b7d60bc0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bin/nasm
{% endblock %}
