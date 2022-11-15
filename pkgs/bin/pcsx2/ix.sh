{% extends '//die/c/cmake.sh' %}

{# heavy X11 deps #}

{% block fetch %}
https://github.com/PCSX2/pcsx2/archive/refs/tags/v1.7.3064.zip
sha:8a85bc6f9069c43fb3c08d3bcc1311f853d994af209ebee3368cd4a853a0e006
https://github.com/ocornut/imgui/archive/refs/tags/v1.88.tar.gz
sha:9f14c788aee15b777051e48f868c5d4d959bd679fc5050e3d2a29de80d8fd32e
https://github.com/rtissera/libchdr/archive/045f2a7f23f5ac10c0122f6f56e42023dfb71e2a.zip
sha:da82b7c96eff25b8f9c3af0d43346256968bcdb091ef22b83f80dcf42abb5bbd
{% endblock %}

{% block unpack %}
mkdir src; cd src
extract 1 ${src}/v1.7*
(cd 3rdparty/imgui/imgui; extract 1 ${src}/v1.8*)
(cd 3rdparty/libchdr/libchdr; extract 1 ${src}/045*)
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/aio
lib/c++
lib/fmt
lib/cap
lib/zip
lib/zstd
lib/pcap
lib/xml/2
lib/intl
lib/udev
lib/ryml
lib/sdl/2
lib/opengl
lib/wayland
lib/glslang
lib/sdl/deps
lib/harfbuzz
lib/shim/x11
lib/samplerate
lib/drivers/3d
lib/wx/widgets
lib/soundtouch
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}

{% block bld_tool %}
bld/perl
bin/glslang
bld/gettext
bld/scripts/fakegit
{% endblock %}

{% block cmake_flags %}
CUBEB_API=OFF
USE_OPENGL=OFF
USE_VULKAN=OFF
WAYLAND_API=ON
ENABLE_TESTS=OFF
XDG_STD=ON
SDL2_API=ON
X11_API=OFF
{% endblock %}

{% block setup %}
export CXXFLAGS="-std=c++17 ${CXXFLAGS}"
{% endblock %}

{% block patch %}
>pcsx2/PAD/Linux/keyboard.cpp
>pcsx2/PAD/Linux/Config.cpp
>pcsx2/GS/Renderers/Common/GSRenderer.cpp

sed -e 's|.*X11 REQ.*||' -e 's|.*X11::X11.*||' -i cmake/SearchForStuff.cmake

find . -type f | while read l; do
    sed -e 's|libzstd_shared|libzstd_static|' \
        -e 's|PAGE_SIZE|PAGE_SIZE_XXX|g' \
        -i ${l}
done

sed -e 's|OpenGL::GL||' -i pcsx2/CMakeLists.txt
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
