{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/sgiurgiu/reddit_desktop
{% endblock %}

{% block git_branch %}
1.0.172
{% endblock %}

{% block git_sha %}
14fbb56ea2013e2c48d1cc2b79d54add4fea49b74f26c9a798788a2de14d66b0
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/mpv
lib/fmt
lib/stb
lib/glfw
lib/boost
lib/gumbo
lib/opengl
lib/spdlog
lib/openssl
lib/sqlite/3
lib/freetype
lib/uriparser
lib/shim/glew
lib/glfw/deps
lib/range/v3/std
lib/shim/fake(lib_name=OpenGL)
{% endblock %}

{% block cmake_flags %}
ENABLE_TESTS=OFF
{% endblock %}

{% block patch %}
sed -e 's|virtual void readMessage|virtual void readMessage() {} void unused|' -i src/connections/redditwebsocketconnection.h
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/bin
ln -s ../share/reddit_desktop/fonts ./
{% endblock %}
