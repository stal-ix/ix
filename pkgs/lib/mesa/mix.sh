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
lib/wayland/protocols/mix.sh
{% endblock %}

{% block bld_libs %}
pypi/Mako/mix.sh
{% endblock %}

{% block bld_tool %}
dev/lang/bison/3/8/mix.sh
dev/lang/flex/mix.sh
dev/build/cmake/mix.sh
dev/build/pkg-config/mix.sh
{% endblock %}

{% block meson_flags %}
-Dllvm=disabled
-Dshared-llvm=disabled
-Ddri-drivers=
-Dgallium-drivers=swrast
-Dgallium-nine=false
-Dshared-glapi=false
-Dglx=disabled
-Dvalgrind=disabled
-Dlibunwind=disabled
-Dplatforms=wayland
-Dvulkan-drivers=
{% endblock %}

{% block patch %}
find . | grep meson.build | while read l; do
    sed -e 's|shared_library|static_library|g' -i ${l}
done

cat src/gbm/meson.build | grep -v 'version : ' > _ && mv _ src/gbm/meson.build
{% endblock %}

{% block install %}
exit 1
{% endblock %}
