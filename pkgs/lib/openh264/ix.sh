{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/cisco/openh264/archive/refs/tags/v2.5.0.tar.gz
sha:94c8ca364db990047ec4ec3481b04ce0d791e62561ef5601443011bdc00825e3
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/nasm
{% endblock %}
