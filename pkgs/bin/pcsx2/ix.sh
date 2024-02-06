{% extends '//die/c/cmake.sh' %}

{# heavy X11 deps #}

{% block git_repo %}
https://github.com/PCSX2/pcsx2
{% endblock %}

{% block git_branch %}
v1.7.4717
{% endblock %}

{% block git_sha %}
bd1d3d7ef559e7ace318d85e6ba8210f0e48115f5f109e2886e3908c26a137e4
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
lib/ffmpeg
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
USE_LINKED_FFMPEG=ON
{% endblock %}

{% block setup_target_flags %}
export CXXFLAGS="-std=c++17 ${CXXFLAGS}"
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
