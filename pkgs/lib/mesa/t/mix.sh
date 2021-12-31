{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://archive.mesa3d.org//mesa-21.3.1.tar.xz
d6efe1ecc0680cd1adb942f05600d884
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
-Ddri-drivers=
-Dvulkan-drivers=amd
-Dgallium-drivers=zink

-Dvalgrind=disabled
-Dlibunwind=disabled

-Dplatforms=wayland
-Degl-native-platform=wayland

-Degl=enabled
-Dglx=disabled
-Dgles2=enabled
-Dopengl=true
-Dgallium-nine=false

-Dcpp_rtti=false
-Dshader-cache=disabled
-Dllvm=disabled
-Dshared-llvm=disabled
{% endblock %}
