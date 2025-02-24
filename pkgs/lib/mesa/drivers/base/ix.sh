{% extends '//lib/mesa/drivers/t/ix.sh' %}

{% block install %}
{{super()}}
rm -rf ${out}/lib/pkgconfig
rm -rf ${out}/include
{% endblock %}

{% block patch %}
sed -e 's|glesv2|opengl|' -i src/mapi/es2api/meson.build
{{super()}}
{% endblock %}
