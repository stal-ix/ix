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
lib/shim/glew
lib/glfw/deps
lib/range/v3/std
lib/shim/fake(lib_name=OpenGL)
{% endblock %}

{% block cmake_flags %}
ENABLE_TESTS=OFF
{% endblock %}

{% block setup %}
export CXXFLAGS="-ftemplate-backtrace-limit=0 ${CXXFLAGS}"
{% endblock %}

{% block patch %}
sed -e 's|virtual void readMessage|virtual void readMessage() {} void unused|' -i src/connections/redditwebsocketconnection.h
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
ln -s ../share/reddit_desktop/fonts ./
{% endblock %}
