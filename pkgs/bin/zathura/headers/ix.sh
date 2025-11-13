{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
zathura
{% endblock %}

{% block version %}
0.5.14
{% endblock %}

{% block fetch %}
https://github.com/pwmt/zathura/archive/refs/tags/{{self.version().strip()}}.tar.gz
e7a6bdfe90ed2d7405c4aa8e35f72ba00eda8306ea0e3dda6c02d0edbb00ce6f
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
