{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://archive.mesa3d.org/mesa-22.0.4.tar.xz
sha:c7971f58fa826e474617cda53250c6600fce60994b9fac5b641522e21f471ed4
#https://archive.mesa3d.org/mesa-22.1.4.tar.xz
#sha:670d8cbe8b72902a45ea2da68a9da4dc4a5d99c5953a926177adbce1b1640b76
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/drm
lib/expat
lib/wayland
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}

{% block bld_libs %}
pip/Mako
lib/mesa/fakes
{% endblock %}

{% block bld_tool %}
bld/make
bld/flex
bld/bison
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
cat << EOF > merge.py
{% include 'merge.py' %}
EOF

python3 ./merge.py src/util/00-mesa-defaults.conf src/amd/vulkan/00-radv-defaults.conf > _
mv _ src/util/00-mesa-defaults.conf

cat << EOF >> src/util/xmlconfig.h
#undef WITH_XMLCONFIG
#define WITH_XMLCONFIG 0
EOF

cat << EOF > bin/install_megadrivers.py
#!$(which sh)
EOF

chmod +x bin/install_megadrivers.py
{% endblock %}

{% block meson_cross %}
{% endblock %}
