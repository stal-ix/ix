{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/pwmt/zathura-pdf-mupdf/archive/refs/tags/0.4.0.tar.gz
sha:60663e9aad4b639f86fc4e54614361a653a48dcf257499a98cb050ed19a70af8
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
bld/librarian
{% endblock %}

{% block meson_flags %}
plugindir=${out}/mod
{% endblock %}

{% block install %}
{{super()}}
patchns ${out}/mod/*.a mupdf_
rm -r ${out}/share
{% endblock %}
