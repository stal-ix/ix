{% extends '//die/c/meson.sh' %}

{% block lib_deps %}
lib/c
lib/glib
lib/cairo
lib/girara
{% endblock %}

{% block build_flags %}
wrap_cc
wrap_rdynamic
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
mkdir ${out}/lib
cp ${tmp}/lib/lib{{dl_orig}}.a ${out}/lib/
patchns ${out}/lib/*.a {{basename}}_
{% endblock %}
