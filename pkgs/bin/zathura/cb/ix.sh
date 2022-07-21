{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.pwmt.org/pwmt/zathura-cb/-/archive/0.1.10/zathura-cb-0.1.10.tar.bz2
sha:27ff52d4978b2d5c009ae72d62afec8719aa84829bdaea79f3cc5206d335e5fb
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/cairo
lib/girara
lib/archive
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
patchns ${out}/mod/*.a cb_
rm -r ${out}/share
{% endblock %}
