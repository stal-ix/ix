{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/chergert/ptyxis/-/archive/46.1/ptyxis-46.1.tar.bz2
sha:83d718c94ce9c4e8d425dcfadec08a5b0ceb5a1a2583adb186611b720bb4e676
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
