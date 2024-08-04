{% extends 't/lib/ix.sh' %}

{% block install %}
{{super()}}
rm -rf ${out}/share
rm -rf ${out}/lib/gi*
rm -rf ${out}/lib/gobject-introspection/giscanner
sed -e 's|.*bindir.*||' -i ${out}/lib/pkgconfig/gobject-introspection-no-export-1.0.pc
sed -e 's|.*bindir.*||' -i ${out}/lib/pkgconfig/gobject-introspection-1.0.pc
{% endblock %}
