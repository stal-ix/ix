{% extends '//lib/mesa/base/ix.sh' %}

{% block lib_deps %}
lib/elfutils
{{super()}}
{% endblock %}

{% block meson_flags %}
valgrind=disabled
libunwind=disabled
platforms=wayland
egl-native-platform=wayland
egl=disabled
glx=disabled
gles2=disabled
opengl=false
shader-cache=disabled
llvm=disabled
shared-llvm=disabled
lmsensors=disabled
amd-use-llvm=false
vulkan-drivers=amd
gallium-drivers=
{% endblock %}

{% block env %}
export VULKAN_LIB=${out}/lib/libvulkan_radeon.a
{% endblock %}
