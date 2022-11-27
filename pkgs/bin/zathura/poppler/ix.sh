{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://pwmt.org/projects/zathura-pdf-poppler/download/zathura-pdf-poppler-0.3.1.tar.xz
sha:ee8127532cc6f92bf32d48a6a0d4c61e33cd4df49a3159e57592877ba19e108b
{% endblock %}

{% block lib_deps %}
lib/c
lib/girara
lib/poppler
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
patchns ${out}/mod/*.a poppler_
rm -r ${out}/share
{% endblock %}
