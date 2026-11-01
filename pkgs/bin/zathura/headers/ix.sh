{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
zathura
{% endblock %}

{% block version %}
2026.10.23
{% endblock %}

{% block fetch %}
https://github.com/pwmt/zathura/archive/refs/tags/{{self.version().strip()}}.tar.gz
664e3770fd487e3a0a47b05bb53b25cf0deca4ca001c7b82b0fb2fbb754b37d8
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
