{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/sgiurgiu/reddit_desktop
{% endblock %}

{% block git_branch %}
1.0.123
{% endblock %}

{% block git_sha %}
34b5fcd7cce08087893bb377a266fea7c85663d9d4a17994c196408a7c4ed203
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/mpv
lib/fmt
lib/stb
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
    sed -e 's|GLEW::GLEW||' \
        -e 's|find_p.*GLEW.*||' \
        -e 's|find_p.*freetype.*||' \
        -e 's|find_p.*unoff.*||' \
        -e 's|find_p.*Stb.*||' \
        -e 's|OpenGL::GL||' \
        -e 's|GLEW::GLEW||' \
        -e 's|unofficial::sqlite3::sqlite3||' \
        -e 's|GL/glew.h|GL/gl.h|' \
        -e 's|.*glewInit.*||' \
        -i ${l}
done
{% endblock %}
