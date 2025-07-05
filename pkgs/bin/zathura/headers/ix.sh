{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
zathura
{% endblock %}

{% block version %}
0.5.12
{% endblock %}

{% block fetch %}
https://github.com/pwmt/zathura/archive/refs/tags/{{self.version().strip()}}.tar.gz
5cd95407d30d892ab1c957e3da38ca2ebb5528b432f898df1d66f637d9c4120d
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtk/3
lib/cairo
lib/girara
lib/sqlite/3
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
{% endblock %}

{% block patch %}
sed -e 's|.*export_dynamic.*||' -i meson.build
{% endblock %}
