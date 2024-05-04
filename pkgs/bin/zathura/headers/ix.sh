{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/pwmt/zathura/archive/refs/tags/0.5.6.tar.gz
sha:7a61e48e5a36826b95f4e3c550e1f6e8059da7c73e72abb0b16ef2485e6136bd
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
