{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/chergert/ptyxis/-/archive/47.6/ptyxis-47.6.tar.bz2
sha:8a4f6ce2269bb7e2dd1a25e7f879426cd52c9bbfcfbe04aed5622c5feae35135
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
