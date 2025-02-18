{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/WerWolv/ImHex
{% endblock %}

{% block git_commit %}
v1.37.1
{% endblock %}

{% block git_sha %}
ab96820deb435e3c88476393a3721387ff415fc46b1838b89f27507c42767046
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/fmt
lib/dbus
lib/curl
lib/yara
lib/glfw
lib/opengl
lib/archive
lib/freetype
lib/execinfo
lib/decor/dl
lib/mbedtls/3
lib/cap/stone
lib/glfw/deps
lib/python/3/10
lib/json/nlohmann
lib/shim/fake(lib_name=glfw)
{% endblock %}

{% block bld_tool %}
bld/python
bld/prepend
{% endblock %}

{% block cpp_defines %}
llvm=llvm_imhex
{% endblock %}

{% block patch %}
sed -e 's|OBJECT|STATIC|' \
    -i plugins/script_loader/support/c/CMakeLists.txt

prepend main/gui/source/messaging/linux.cpp << EOF
#include <unistd.h>
#include <jthread.hpp>
EOF
{% endblock %}

{% block cmake_flags %}
OPENGL_opengl_LIBRARY=/
OPENGL_glx_LIBRARY=/
OPENGL_GLX_INCLUDE_DIR=/nowhere
OPENGL_INCLUDE_DIR=/nowhere
IMHEX_STATIC_LINK_PLUGINS=ON
IMHEX_OFFLINE_BUILD=ON
USE_SYSTEM_FMT=ON
USE_SYSTEM_CURL=ON
USE_SYSTEM_YARA=ON
USE_SYSTEM_CAPSTONE=ON
USE_SYSTEM_NLOHMANN_JSON=ON
{% endblock %}

{% block build_flags %}
shut_up
wrap_cc
{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/bin/imhex-updater
{% endblock %}
