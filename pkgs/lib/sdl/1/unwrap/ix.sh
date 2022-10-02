{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/sdl12-compat/archive/refs/tags/release-1.2.56.tar.gz
sha:f62f3e15f95aade366ee6c03f291e8825c4689390a6be681535259a877259c58
{% endblock %}

{% block lib_deps %}
lib/c
lib/opengl
lib/sdl/chimera
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
mv libSDL-1.2.a libSDL.a
cd pkgconfig
cp sdl12_compat.pc sdl.pc
{% endblock %}
