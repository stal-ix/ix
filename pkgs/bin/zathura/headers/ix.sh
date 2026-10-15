{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
zathura
{% endblock %}

{% block version %}
2026.10.4
{% endblock %}

{% block fetch %}
https://github.com/pwmt/zathura/archive/refs/tags/{{self.version().strip()}}.tar.gz
82acff794947fb919fd80ed26de87cf803297ea0dc6e846d1308b11c1d0dba3c
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtk/4
lib/cairo
lib/girara
lib/json/glib
lib/magic
lib/sqlite/3
lib/xxhash
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
{% endblock %}

{% block meson_tool %}
bld/meson/6
{% endblock %}

{% block build_flags %}
wrap_cc
wrap_rdynamic
{% endblock %}

{% block patch %}
sed -e 's|.*export_dynamic.*||' -i meson.build
{% endblock %}
