{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
zathura
{% endblock %}

{% block version %}
0.5.13
{% endblock %}

{% block fetch %}
https://github.com/pwmt/zathura/archive/refs/tags/{{self.version().strip()}}.tar.gz
b792faed6e6e6a59b7609928d17d366c1a3d22d9ce3b4af23aeef124e60a63b0
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
