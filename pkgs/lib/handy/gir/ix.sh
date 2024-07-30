{% extends '//lib/handy/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/glib/gir
lib/harfbuzz/gir
{% endblock %}

{% block meson_flags %}
{{super()}}
introspection=enabled
{% endblock %}

{% block host_libs %}
{{super()}}
lib/handy
lib/handy/dl
lib/harfbuzz/gir
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/gir
bin/vala
lib/harfbuzz/gir
lib/glib/gir
lib/build/gir
lib/build/vala
{% endblock %}

{% block postinstall %}
mv ${out}/lib/gi* ${out}/share/
rm -rf ${out}/bin ${out}/lib ${out}/include
{% endblock %}

{% block env %}
export GIRPATH="${out}/share/gir-1.0:\${GIRPATH}"
export VALAFLAGS="--girdir=${out}/share/gir-1.0 --vapidir=${out}/share/vala/vapi \${VALAFLAGS}"
export GIRSFLAGS="--add-include-path=${out}/share/gir-1.0 \${GIRSFLAGS}"
export GIRCFLAGS="--includedir=${out}/share/gir-1.0 \${GIRCFLAGS}"
{% endblock %}
