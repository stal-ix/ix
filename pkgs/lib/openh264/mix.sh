{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/cisco/openh264/archive/refs/tags/v2.2.0.tar.gz
sha:e4e5c8ba48e64ba6ce61e8b6e2b76b2d870c74c270147649082feabb40f25905
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bin/nasm
{% endblock %}
