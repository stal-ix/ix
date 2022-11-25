{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://pwmt.org/projects/zathura-djvu/download/zathura-djvu-0.2.9.tar.xz
sha:96e6f8a6ee53231073b2f7003264872f84501e63c3da7bf0598d046286b0c200
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/cairo
lib/girara
lib/djvulibre
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
patchns ${out}/mod/*.a djvu_
rm -r ${out}/share
{% endblock %}
