{% extends 't/ix.sh' %}

{% block bld_libs %}
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
export XDG_DATA_DIRS=${out}/lib
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/lib/gobject-introspection/giscanner
sed -e 's|.*bindir.*||' -i ${out}/lib/pkgconfig/gobject-introspection-no-export-1.0.pc
sed -e 's|.*bindir.*||' -i ${out}/lib/pkgconfig/gobject-introspection-1.0.pc
mv ${out}/share/gir-1.0 ${out}/lib/
{% endblock %}
