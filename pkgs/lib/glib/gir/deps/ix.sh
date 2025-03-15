{% extends '//lib/glib/t/ix.sh' %}

{% block meson_flags %}
{{super()}}
introspection=enabled
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/gi/repository
{% endblock %}

{% block host_libs %}
{{super()}}
lib/glib/dl
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/gir
{% endblock %}

{% block ninja_build_targets %}
girepository/libgirepository-2.0.a
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp ${tmp}/obj/girepository/libgirepository-2.0.a ${out}/lib/
{% endblock %}
