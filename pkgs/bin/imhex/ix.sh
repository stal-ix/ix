{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/WerWolv/ImHex
{% endblock %}

{% block git_branch %}
v1.32.1
{% endblock %}

{% block git_sha %}
15dccbe93875394c79e286f87ef3d77f4cd2912cdd98902b45e85a73e43e8bdc
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
lib/mbedtls/3
lib/cap/stone
lib/glfw/deps
lib/python/3/10
lib/json/nlohmann
lib/shim/fake(lib_name=glfw)
{% endblock %}

{% block bld_tool %}
bld/dlfcn
bld/python
{% endblock %}

{% block cpp_includes %}
${PWD}/lib/third_party/llvm-demangle/include
{% endblock %}

{% block cpp_defines %}
llvm=llvm_imhex
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|tellg() + a_length|tellg() + (std::streamoff)a_length|g' -i "${l}"
done

base64 -d << EOF > lib/libimhex/source/api/plugin_manager.cpp
{% include 'plugin_manager.cpp/base64' %}
EOF

base64 -d << EOF > lib/third_party/nativefiledialog/src/nfd_portal.cpp
{% include 'nfd_portal.cpp/base64' %}
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
