{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/pwmt/zathura/archive/refs/tags/0.5.9.tar.gz
sha:6108bfe87676c0ddc1289dd4278ac8c7ab9e47cb4bb419f71786baa99e14760f
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
