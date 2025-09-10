{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wf-config
{% endblock %}

{% block version %}
0.10.0
{% endblock %}

{% block fetch %}
https://github.com/WayfireWM/wf-config/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4264edf9f5f5ff9bccaee1ab3f5b2613a0db526bc90c15d7c82eb05a3fc81307
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
