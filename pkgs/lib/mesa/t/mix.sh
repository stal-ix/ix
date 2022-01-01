{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://archive.mesa3d.org/mesa-21.3.3.tar.xz
9363a365fc8fbf8c34fa3ceb1151f547
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/drm
lib/zstd
#lib/llvm
lib/expat
lib/wayland
lib/elfutils
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}

{% block bld_libs %}
pypi/Mako
{% endblock %}

{% block bld_tool %}
dev/lang/flex
dev/build/make
dev/lang/bison/3/8
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
