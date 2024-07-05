{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.prevanders.net/libdwarf-0.10.1.tar.xz
sha:b511a2dc78b98786064889deaa2c1bc48a0c70115c187900dd838474ded1cc19
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
