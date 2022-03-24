{% extends '//mix/meson.sh' %}

{% block fetch %}
#https://gitlab.gnome.org/GNOME/vte/-/archive/0.67.90/vte-0.67.90.tar.bz2
#sha:0c42964e377ad37da689c0017457a5c9f38b070669297f40501143a88cadb908
https://gitlab.gnome.org/GNOME/vte/-/archive/6a80bec4bf7a1e52057c03d2c73cce1bf248c6d7/vte-6a80bec4bf7a1e52057c03d2c73cce1bf248c6d7.tar.bz2
sha:b44f014ed0e8563b5bc78b1ff0204bcb2dbb5dd2eb0a2ee7aa8fe99046d61ec6
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/icu
lib/atk
lib/glib
lib/gtk/4
lib/pango
lib/pcre/2
lib/fribidi
{% endblock %}

{% block bld_tool %}
bin/glib/codegen
{% endblock %}

{% block meson_flags %}
gir=false
gtk4=true
gtk3=false
vapi=false
gnutls=false
_systemd=false
{% endblock %}
