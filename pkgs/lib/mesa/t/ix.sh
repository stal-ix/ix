{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/mesa/mesa/-/archive/mesa-23.1.8/mesa-mesa-23.1.8.tar.bz2
sha:ceebfbf8023b679a327c3015b045a3462d42ab882f60dcb77be96f575916118b
#https://gitlab.freedesktop.org/mesa/mesa/-/archive/mesa-23.0.3/mesa5B-mesa-23.0.3.tar.bz2
#sha:f35829243fe53bd4986d8a0169d97a70c124d172e9f83a2a8c2826590870e905
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
bin/glslang
bld/wayland
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
lmsensors=disabled
{% endblock %}

{% block patch %}
cat << EOF > merge.py
{% include 'merge.py' %}
EOF

#find . -type f -name '*defaults.conf'
#exit 1

python3 ./merge.py src/util/00-mesa-defaults.conf src/util/00-radv-defaults.conf > _
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
