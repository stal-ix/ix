{% extends '//mix/meson.sh' %}

{% block fetch %}
#https://gitlab.freedesktop.org/mesa/mesa/-/archive/mesa-22.0.2/mesa-mesa-22.0.2.tar.bz2
#sha:600f4ae87b9c9d5ce6aed5ebaf776549fdb304bceea97a82122b5e4e6b94e4cf
https://gitlab.freedesktop.org/mesa/mesa/-/archive/mesa-22.0.1/mesa-mesa-22.0.1.tar.bz2
sha:fb38c479ddba37276064116e34ab72d95435148acc9fc81662786bb0c2c1c8b7
#https://gitlab.freedesktop.org/mesa/mesa/-/archive/mesa-22.0.3/mesa-mesa-22.0.3.tar.bz2
#sha:5d074e1d548f77bcb6d0cc400a40ab6bb21639877e70da1f4d91fa3c3c96e0af
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
cat << EOF > bin/install_megadrivers.py
#!$(which sh)
EOF

chmod +x bin/install_megadrivers.py
{% endblock %}

{% block meson_cross %}
{% endblock %}
