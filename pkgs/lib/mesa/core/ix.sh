{% extends '//lib/mesa/t/ix.sh' %}

{% block meson_flags %}
{{super()}}
vulkan-drivers=
gallium-drivers=
{% endblock %}

{% block install %}
{{super()}}

#llvm-ar q ${out}/lib/libmesa_utils.a \
#    ${tmp}/obj/src/gallium/frontends/dri/libdri.a.p/*.o \
#    ${tmp}/obj/src/gallium/auxiliary/libgallium.a.p/*.o \
#    ${tmp}/obj/src/mesa/libmesa.a.p/*.o

cp ${tmp}/obj/src/gallium/targets/dri/libgallium-24.3.4.so ${out}/lib/libgallium.a

find ${out}/lib/pkgconfig -type f -name '*.pc' | while read l; do
    sed -e 's|glesv1_cm,||g' -i ${l}
    sed -e 's|-lgallium.*||' -i ${l}
done

cp ${out}/lib/pkgconfig/opengl.pc ${out}/lib/pkgconfig/glesv2.pc
{% endblock %}

{% block env %}
export CPPFLAGS="-DEGL_NO_X11=1 \${CPPFLAGS}"
export COFLAGS="--with-gallium=${out} \${COFLAGS}"
export MESA_HEADERS=${out}/include
{% endblock %}

{% block patch %}
sed -e 's|glesv2|opengl|' -i src/mapi/es2api/meson.build
{{super()}}
{% endblock %}
