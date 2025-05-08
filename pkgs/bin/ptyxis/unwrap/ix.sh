{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
ptyxis
{% endblock %}

{% block version %}
48.3
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/chergert/ptyxis/-/archive/{{self.version().strip()}}/ptyxis-{{self.version().strip()}}.tar.bz2
sha:9dc7addeca9311d32c07152af5337d9186400f9d50441848a63aa22764aa3651
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
