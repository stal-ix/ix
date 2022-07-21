{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://pwmt.org/projects/zathura-pdf-mupdf/download/zathura-pdf-mupdf-0.3.8.tar.xz
sha:c205b4cf500d8cfe9eceaade54e5fa8d4cd1298cd85f17a6f50c647259116217
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
