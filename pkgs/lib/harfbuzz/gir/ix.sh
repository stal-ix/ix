{% extends '//lib/harfbuzz/unwrap/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/build/gir
lib/gi/repository
{% endblock %}

{% block host_libs %}
{{super()}}
lib/c
lib/glib
lib/harfbuzz/dl/core
lib/harfbuzz/dl/gobject
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/gir
{% endblock %}

{% block meson_flags %}
{{super()}}
introspection=enabled
default_library=shared
{% endblock %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}

{% block postinstall %}
mv ${out}/lib/gi* ${out}/share/
rm -rf ${out}/include ${out}/doc ${out}/bin ${out}/lib
{% endblock %}

{% block env %}
export GIRSFLAGS="--add-include-path=${out}/share/gir-1.0 \${GIRSFLAGS}"
export GIRCFLAGS="--includedir=${out}/share/gir-1.0 \${GIRCFLAGS}"
{% endblock %}
