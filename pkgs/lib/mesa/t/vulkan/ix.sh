{% extends '//lib/mesa/t/ix.sh' %}

{% block meson_flags %}
egl=disabled
glx=disabled
opengl=false
gles2=disabled
gallium-drivers=
platforms=wayland
valgrind=disabled
lmsensors=disabled
libunwind=disabled
shared-llvm=disabled
shader-cache=disabled
egl-native-platform=wayland
{% endblock %}
