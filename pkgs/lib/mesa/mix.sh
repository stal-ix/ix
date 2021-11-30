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
-Ddri-drivers=
-Dvulkan-drivers=
-Dgallium-drivers=swrast

-Dvalgrind=disabled
-Dlibunwind=disabled

-Dplatforms=wayland

-Degl=true
-Dglx=disabled
-Dgles2=true
-Dopengl=true
-Dgallium-nine=false

-Dtools=glsl
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}

{% block patch %}
find . | grep meson.build | while read l; do
    sed -e 's|shared_library|library|g' -i ${l}
done
{% endblock %}
