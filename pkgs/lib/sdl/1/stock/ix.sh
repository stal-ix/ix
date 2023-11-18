{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/sdl12-compat/archive/refs/tags/release-1.2.64.tar.gz
sha:3e308e817c7f0c6383225485e9a67bf1119ad684b8cc519038671cc1b5d29861
{% endblock %}

{% block lib_deps %}
lib/c
lib/opengl
{% endblock %}

{% block bld_libs %}
lib/sdl/2
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
mv libSDL-1.2.a libSDL.a || mv libSDL-1.2.0.a libSDL.a
cd pkgconfig
cp sdl12_compat.pc sdl.pc
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/SDL \${CPPFLAGS}"
{% endblock %}
