{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.prevanders.net/libdwarf-0.4.1.tar.xz
sha:34277b969d30be3cc4c6fbce6926dd3e6f9ea9a27b01951c6753b479aadfd5ef
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block meson_flags %}
libelf=false
{% endblock %}
