{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/chergert/ptyxis/-/archive/48.0/ptyxis-48.0.tar.bz2
sha:b1db921722318efa02b0339e9ab732361576afcdbac7dff3a36ef6180b32b50c
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
