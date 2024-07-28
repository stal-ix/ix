{% extends 't/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/build/gir
lib/build/vala
{% endblock %}

{% block host_libs %}
{{super()}}
lib/glib/dl
lib/gi/repository/bootstrap/dl
lib/gi/repository/bootstrap/shim
{% endblock %}

{% block bld_tool %}
bld/gir
{{super()}}
{% endblock %}

{% block meson_flags %}
{{super()}}
gi_cross_use_prebuilt_gi=true
{% endblock %}

{% block env %}
{{super()}}
export GIRPATH="${out}/share/gir-1.0:\${GIRPATH}"
export VALAFLAGS="--girdir=${out}/share/gir-1.0 \${VALAFLAGS}"
export GIRSFLAGS="--add-include-path=${out}/share/gir-1.0 \${GIRSFLAGS}"
export GIRCFLAGS="--includedir=${out}/share/gir-1.0 \${GIRCFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/lib/gobject-introspection/giscanner
sed -e 's|.*bindir.*||' -i ${out}/lib/pkgconfig/gobject-introspection-no-export-1.0.pc
sed -e 's|.*bindir.*||' -i ${out}/lib/pkgconfig/gobject-introspection-1.0.pc
{% endblock %}

{% block postinstall %}
rm -rf ${out}/bin
cp -R ${out}/share/gir-1.0 ${out}/lib/
{% endblock %}
