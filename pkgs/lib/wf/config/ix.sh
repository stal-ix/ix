{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
wf-config
{% endblock %}

{% block version %}
0.11.0
{% endblock %}

{% block fetch %}
https://github.com/WayfireWM/wf-config/archive/refs/tags/v{{self.version().strip()}}.tar.gz
bdccae471c079cdccf4e8fed28622a3b1f04db09349fa0e4fa52b335e815f8d0
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
