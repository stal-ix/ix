{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/chergert/ptyxis/-/archive/47.5/ptyxis-47.5.tar.bz2
sha:ed4371f5124e3c682febe4356690a277fd5463c7f78c9421634ef26a6c1cf1b8
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
