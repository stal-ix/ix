{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
ptyxis
{% endblock %}

{% block version %}
49.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/chergert/ptyxis/-/archive/{{self.version().strip()}}/ptyxis-{{self.version().strip()}}.tar.bz2
c2b025d7386392685d96cb4776469dffb9ab12655902269e2b80807a4ca6f6ce
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
