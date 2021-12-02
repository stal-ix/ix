{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://mesa.freedesktop.org/archive/mesa-21.2.5.tar.xz
63ef94beb6677db0c5a43289e7e76ba4
{% endblock %}

{% block lib_deps %}
lib/z/mix.sh
lib/drm/mix.sh
lib/zstd/mix.sh
lib/expat/mix.sh
lib/wayland/mix.sh
{% endblock %}

{% block bld_libs %}
pypi/Mako/mix.sh
{% endblock %}

{% block bld_tool %}
dev/lang/flex/mix.sh
dev/lang/bison/3/8/mix.sh
lib/wayland/protocols/mix.sh
{% endblock %}

{% block meson_flags %}
-Ddri-drivers=
-Dvulkan-drivers=
-Dgallium-drivers=swrast

-Dvalgrind=disabled
-Dlibunwind=disabled

-Dplatforms=wayland

-Degl=enabled
-Dglx=disabled
-Dgles2=enabled
-Dopengl=true
-Dgallium-nine=false

-Dtools=glsl
{% endblock %}

{% block patch %}
cd src/gallium/frontends/dri

for l in *.c *.h; do
    sed -e 's|dri2_lookup_egl_image|dri2_lookup_egl_image_xxx|g' -i ${l}
done
{% endblock %}

{% block install %}
{{super()}}

# TODO
>empty.c
clang -c empty.c
ar q empty.a empty.o
mv empty.a ${out}/lib/libGLESv1_CM.a
{% endblock %}

{% block env %}
export COFLAGS="--with-gallium=${out} \${COFLAGS}"
{% endblock %}
