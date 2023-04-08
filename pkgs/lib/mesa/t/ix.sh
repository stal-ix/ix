{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/mesa/mesa/-/archive/mesa-23.0.2/mesa-mesa-23.0.2.tar.bz2
sha:20617a24eafd5e8ee7c8070a23d93bd66d378cee4715e0e219b0217c1d28c428
#https://gitlab.freedesktop.org/mesa/mesa/-/archive/mesa-22.3.7/mesa-mesa-22.3.7.tar.bz2
#sha:687ee41d6725fefcdd78599756b290de6c52f76df5d84cae363c9d943641b1d4
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
