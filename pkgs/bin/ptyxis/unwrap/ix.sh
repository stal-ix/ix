{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
ptyxis
{% endblock %}

{% block version %}
48.4
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/chergert/ptyxis/-/archive/{{self.version().strip()}}/ptyxis-{{self.version().strip()}}.tar.bz2
sha:e430c7d349afdb8d96291f05dbb61b44808917f6ba62b9733397805e647bca9e
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
