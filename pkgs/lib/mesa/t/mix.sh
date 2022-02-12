{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/mesa/mesa/-/archive/mesa-21.3.4/mesa-mesa-21.3.4.tar.bz2
sha:d181bc27ed9ca523af2208c7de438b92100bd0837d56cd06ecbd1c341b1216cf
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
lib/wayland/protocols
{% endblock %}

{% block meson_flags %}
dri-drivers=
vulkan-drivers=amd
gallium-drivers=zink

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

{% block meson_cross %}
{% endblock %}
