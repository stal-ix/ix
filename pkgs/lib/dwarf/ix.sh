{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.prevanders.net/libdwarf-0.9.1.tar.xz
sha:877e81b189edbb075e3e086f6593457d8353d4df09b02e69f3c0c8aa19b51bf4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
