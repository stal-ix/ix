{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/sgiurgiu/reddit_desktop/archive/refs/tags/1.0.123.tar.gz
sha:f427cd8cc4b77e7c005b4e198b4842aed2b586744ac17b6813131bb484bab2dc
https://github.com/mity/md4c/archive/refs/tags/release-0.4.8.tar.gz
sha:4a457df853425b6bb6e3457aa1d1a13bccec587a04c38c622b1013a0da41439f
{% endblock %}

{% block unpack %}
mkdir src; cd src
extract 1 ${src}/1*
(cd external/md4c; extract 1 ${src}/r*)
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
lib/mesa/gl
lib/sqlite/3
lib/freetype
lib/mesa/egl
lib/sdl/deps
lib/range/v3
lib/uriparser
{% endblock %}

{% block setup %}
export CPPFLAGS="-I${lib_freetype_hb}/include/freetype2 ${CPPFLAGS}"
export CXXFLAGS="-include algorithm -include ranges ${CXXFLAGS}"
{% endblock %}

{% block cmake_flags %}
OPENGL_opengl_LIBRARY=${lib_mesa}/lib/libGLESv2.a
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
