{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/WayfireWM/wf-config/archive/refs/tags/v0.9.0.tar.gz
sha:973a47795d3397d281d89c561903867f691c9fe8c3d141ba887afd12902c790d
{% endblock %}

{% block lib_deps %}
lib/c
lib/glm
lib/c++
lib/xml/2
lib/evdev
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
