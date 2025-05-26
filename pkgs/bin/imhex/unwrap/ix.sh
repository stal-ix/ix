{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/WerWolv/ImHex
{% endblock %}

{% block git_commit %}
v1.37.4
{% endblock %}

{% block git_sha %}
3603f529a50ce54801ca67c49768548bb5632d094dffd3dbd88f69fa22d4d773
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/fmt
lib/dbus
lib/curl
lib/yara
lib/glfw
lib/kernel
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
lib/shim/fake(lib_name=GLX)
lib/shim/fake(lib_name=glfw)
lib/shim/fake(lib_name=OpenGL)
# {{opengl | defined('opengl')}}
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
