{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wf-config
{% endblock %}

{% block version %}
0.9.0
{% endblock %}

{% block fetch %}
https://github.com/WayfireWM/wf-config/archive/refs/tags/v{{self.version().strip()}}.tar.gz
973a47795d3397d281d89c561903867f691c9fe8c3d141ba887afd12902c790d
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
