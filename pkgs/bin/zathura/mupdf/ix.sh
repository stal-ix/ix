{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://pwmt.org/projects/zathura-pdf-mupdf/download/zathura-pdf-mupdf-0.3.9.tar.xz
sha:77f795ea1745b695a50b6864e73569d4ed8ac0eaa4ee2e6069e725c932057c07
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/cairo
lib/mu/pdf
lib/girara
{% endblock %}

{% block bld_libs %}
bin/zathura/headers
{% endblock %}

{% block bld_tool %}
bld/scripts/librarian
{% endblock %}

{% block meson_flags %}
plugindir=${out}/mod
{% endblock %}

{% block install %}
{{super()}}
patchns ${out}/mod/*.a mupdf_
rm -r ${out}/share
{% endblock %}
