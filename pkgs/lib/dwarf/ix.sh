{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.prevanders.net/libdwarf-0.10.0.tar.xz
sha:17b7143c4b3e5949d1578c43e8f1e2abd9f1a47e725e6600fe7ac4833a93bb77
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
