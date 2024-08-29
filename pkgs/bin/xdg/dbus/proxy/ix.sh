{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/flatpak/xdg-dbus-proxy/archive/refs/tags/0.1.6.tar.gz
sha:ee9c1d665f4e3b025a83d522d478ff7930070f2817fc2cb446db0dca93c990b1
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
{% endblock %}
