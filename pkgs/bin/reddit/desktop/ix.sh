{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/sgiurgiu/reddit_desktop
{% endblock %}

{% block git_branch %}
1.0.172
{% endblock %}

{% block git_sha %}
518e87be45fa6992fffb98851c45c595ee408d2c2d0caf6024f628f970a88efc
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/mpv
lib/fmt
lib/stb
lib/glfw
lib/sdl/2
lib/boost
lib/gumbo
lib/opengl
lib/spdlog
lib/openssl
lib/sqlite/3
lib/freetype
lib/sdl/deps
lib/uriparser
lib/range/v3/std
lib/shim/fake(lib_name=OpenGL)
{% endblock %}

{% block setup %}
export CXXFLAGS="-include algorithm -include ranges ${CXXFLAGS}"
{% endblock %}

{% block cmake_flags %}
ENABLE_TESTS=OFF
{% endblock %}

{% block patch %}
find . -type f | while read l; do
    sed -e 's|PkgConfig::Glew||' \
        -e 's|.*pkg_check_modules.*glew.*||' \
        -e 's|GL/glew.h|GL/gl.h|' \
        -e 's|.*glewInit.*||' \
        -i ${l}
done
{% endblock %}
