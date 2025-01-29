{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/chergert/ptyxis/-/archive/47.8/ptyxis-47.8.tar.bz2
sha:be9085efb37edef9cba089b082e9a5ab2deb623bc24e24af9bc0a2f406e1b0da
{% endblock %}

{% block bld_libs %}
lib/c
lib/vte
lib/gtk
lib/glib
lib/portal
lib/adwaita
lib/gtk/deps
lib/shim/wait
lib/json/glib
{% endblock %}

{% block patch %}
>agent/x86_64/force_link_glibc_2.17.h
>agent/libc-compat.h
sed -e 's|libc_compat = true|libc_compat = false|' -i agent/meson.build
{% endblock %}
