{% extends '//lib/mesa/t/sep/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}/lib
rm libgldrivers.a
cd pkgconfig
cp opengl.pc glesv2.pc
{% endblock %}

{% block merge_drivers %}
mv dri/*.so libgldrivers.a
{% endblock %}

{% block env %}
export CPPFLAGS="-DEGL_NO_X11=1 \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -lgbm -lglapi \${LDFLAGS}"
export COFLAGS="--with-gallium=${out} \${COFLAGS}"
export MESA_HEADERS=${out}/include
{% endblock %}

{% block patch %}
sed -e 's|glesv2|opengl|' -i src/mapi/es2api/meson.build
{{super()}}
{% endblock %}
