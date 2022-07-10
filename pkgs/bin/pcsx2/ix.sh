{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/PCSX2/pcsx2/archive/refs/tags/v1.7.3064.zip
sha:8a85bc6f9069c43fb3c08d3bcc1311f853d994af209ebee3368cd4a853a0e006
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
lib/xml2
lib/intl
lib/udev
lib/ryml
lib/sdl/2
lib/opengl
lib/mesa/gl
lib/wayland
lib/glslang
lib/mesa/egl
lib/sdl/deps
lib/harfbuzz
lib/samplerate
lib/drivers/3d
lib/wx/widgets
lib/xiph/speex
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}

{% block bld_tool %}
bin/glslang
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
{% endblock %}

{% block patch %}
sed -e 's|.*X11 REQ.*||' -e 's|.*X11::X11.*||' -i cmake/SearchForStuff.cmake
{% endblock %}
