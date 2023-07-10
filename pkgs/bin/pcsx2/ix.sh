{% extends '//die/c/cmake.sh' %}

{# heavy X11 deps #}

{% block git_repo %}
https://github.com/PCSX2/pcsx2
{% endblock %}

{% block git_branch %}
v1.7.3064
{% endblock %}

{% block git_sha %}
3c02f95ceac56c9111d17bf0b987ef6729b25502d1979cd7ec0b43771f47d0f7
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
lib/intl
lib/udev
lib/ryml
lib/xml/2
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
bld/fakegit
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

{% block build_flags %}
shut_up
{% endblock %}
