{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/mesa/mesa/-/archive/c50bdacbda6dc63d4c794e79357ffebf9756aa8a/mesa-c50bdacbda6dc63d4c794e79357ffebf9756aa8a.tar.bz2
6dcc80901723362551a26584b6057043
{% endblock %}

{% block lib_deps %}
lib/z/mix.sh
lib/drm/mix.sh
lib/zstd/mix.sh
lib/llvm/mix.sh
lib/expat/mix.sh
lib/wayland/mix.sh
lib/elfutils/mix.sh
lib/vulkan/loader/mix.sh
{% endblock %}

{% block bld_libs %}
pypi/Mako/mix.sh
{% endblock %}

{% block bld_tool %}
dev/lang/flex/mix.sh
dev/lang/bison/3/8/mix.sh
dev/build/make/mix.sh
lib/wayland/protocols/mix.sh
{% endblock %}

{% block meson_flags %}
-Ddri-drivers=
-Dvulkan-drivers=amd
-Dgallium-drivers=zink,radeonsi

-Dvalgrind=disabled
-Dlibunwind=disabled

-Dplatforms=wayland
-Degl-native-platform=wayland

-Degl=enabled
-Dglx=disabled
-Dgles2=enabled
-Dopengl=true
-Dgallium-nine=false

{% if kind == 'bin' %}
-Dtools=glsl
{% endif %}

-Dcpp_rtti=false
-Dshader-cache=disabled
#-Dllvm=disabled
-Dshared-llvm=disabled
{% endblock %}

{% block setup %}
export CPPFLAGS="-Dhandle_table_remove=mesa_handle_table_remove ${CPPFLAGS}"
{% endblock %}

{% block patch %}
CD=${PWD}

cd src/gallium/frontends/dri

for l in *.c *.h; do
    for x in dri2_lookup_egl_image dri2_validate_egl_image; do
        sed -e "s|${x}|${x}_xxx|g" -i ${l}
    done
done

cd ${CD}

cd src/gallium/drivers/radeonsi

for l in *.c *.h *.cpp; do
    for x in vi_alpha_is_on_msb si_emit_cache_flush si_cp_dma_prefetch si_cp_dma_clear_buffer si_cp_dma_wait_for_idle; do
        sed -e "s|${x}|${x}_xxx|g" -i ${l}
    done
done
{% endblock %}

{% block install %}
{{super()}}

# TODO
>empty.c
clang -c empty.c
ar q empty.a empty.o
mv empty.a ${out}/lib/libGLESv1_CM.a

cd ${out}/lib/dri

mv zink_dri.so drivers.a
rm *.so
{% endblock %}

{% block env %}
export MESA_DRIVERS="${out}/lib/dri/drivers.a"
export COFLAGS="--with-gallium=${out} \${COFLAGS}"
{% endblock %}
