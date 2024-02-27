{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/chergert/ptyxis/-/archive/08564402b8a9bc53bc2dbd3ff14f9d9598c14b7b/ptyxis-08564402b8a9bc53bc2dbd3ff14f9d9598c14b7b.tar.bz2
sha:2409fb6f1b9e6ad1ab28347945fe6896ba3f956f82edcbb7b7a0d10da5296bc3
{% endblock %}

{% block bld_libs %}
lib/c
lib/vte
lib/gtk
lib/glib
lib/portal
lib/adwaita
lib/shim/wait
lib/json/glib
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
{% endblock %}

{% block patch %}
>agent/x86/force_link_glibc_2.17.h
>agent/x86_64/force_link_glibc_2.17.h
>agent/libc-compat.h
sed -e 's|libc_compat = true|libc_compat = false|' -i agent/meson.build
{% endblock %}
