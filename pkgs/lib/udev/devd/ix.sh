{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/wulf7/libudev-devd/archive/refs/tags/v0.6.0.tar.gz
07cfb6d5000cc72eee2b09fe074aca4aa298ec3db90ed71c810f123285de29e8
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
