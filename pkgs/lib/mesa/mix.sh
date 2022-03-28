{% extends '//lib/mesa/t/sep/mix.sh' %}

{% block run_data %}
lib/mesa/data
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/scripts/reloc
{% endblock %}

{% block configure %}
{{super()}}
relocate "${MESA_DATA}"
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/libgldrivers.a
cd ${out}/lib/pkgconfig
cp opengl.pc glesv2.pc
{% endblock %}

{% block merge_drivers %}
mv dri/*.so libgldrivers.a
{% endblock %}

{% block env_lib %}
export LDFLAGS="-L${out}/lib -lgbm -lglapi \${LDFLAGS}"
export COFLAGS="--with-gallium=${out} \${COFLAGS}"
{% endblock %}

{% block patch %}
sed -e 's|glesv2|opengl|' -i src/mapi/es2api/meson.build
{{super()}}
{% endblock %}
