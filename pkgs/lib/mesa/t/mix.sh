{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/mesa/mesa/-/archive/mesa-22.0.0/mesa-mesa-22.0.0.tar.bz2
sha:e5fe34b3b792885a56086341fc7ebd02fe315dd6956c2cf2ac1075f12222c4e2
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/drm
lib/zstd
lib/expat
lib/wayland
lib/elfutils
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}

{% block bld_libs %}
pip/Mako
{% endblock %}

{% block bld_tool %}
bin/flex
bin/make
bin/bison/3/8
bin/wayland/protocols
{% endblock %}

{% block meson_flags %}
valgrind=disabled
libunwind=disabled
platforms=wayland
egl-native-platform=wayland
egl=enabled
glx=disabled
gles2=enabled
opengl=true
gallium-nine=false
cpp_rtti=false
shader-cache=disabled
llvm=disabled
shared-llvm=disabled
{% endblock %}

{% block patch %}
cat << EOF > bin/install_megadrivers.py
#!$(which sh)
EOF

chmod +x bin/install_megadrivers.py
{% endblock %}

{% block meson_cross %}
{% endblock %}
