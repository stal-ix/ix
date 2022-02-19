{% extends '//mix/meson.sh' %}

{% block fetch %}
https://wayland.freedesktop.org/releases/wayland-1.20.0.tar.xz
5095264157bf0565b921ceaf9d698d98
{% endblock %}

{% block meson_flags %}
documentation=false
tests=false
{% endblock %}
