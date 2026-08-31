{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
ptyxis
{% endblock %}

{% block version %}
50.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/chergert/ptyxis/-/archive/{{self.version().strip()}}/ptyxis-{{self.version().strip()}}.tar.bz2
d8e6e7518b270c09a912a38a7053c92b55cdd6081a5c573af0d3d7c05b258c24
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
{{super()}}
bld/wrap/cc/plugins/logcmd
{% endblock %}

{% block patch %}
>agent/x86_64/force_link_glibc_2.17.h
>agent/libc-compat.h
sed -e 's|libc_compat = true|libc_compat = false|' -i agent/meson.build
{% endblock %}
