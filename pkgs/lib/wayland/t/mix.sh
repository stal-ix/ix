{% extends '//mix/meson.sh' %}

{% block fetch %}
https://wayland.freedesktop.org/releases/wayland-1.20.0.tar.xz
5095264157bf0565b921ceaf9d698d98
{% endblock %}

{% block lib_deps %}
lib/c
lib/ffi
{% endblock %}

{% block run_data %}
aux/adwaita/cursors
{% endblock %}

{% block bld_libs %}
lib/xml2
lib/expat
{% endblock %}

{% block meson_flags %}
documentation=false
tests=false
{% endblock %}

{% block cpp_defines %}
XCURSORPATH=\\\"~/.icons:~/.cursors:${ADWAITA_CURSORS}\\\"
{% endblock %}
