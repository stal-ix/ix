{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/pwmt/zathura/archive/refs/tags/0.5.8.tar.gz
sha:bfe3b76605c9e352dbb80bf4e4558b11453b1f1b30263d1dddf3e717897c7db9
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
