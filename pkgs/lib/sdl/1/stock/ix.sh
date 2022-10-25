{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/sdl12-compat/archive/refs/tags/release-1.2.60.tar.gz
sha:029fa24fe9e0d6a15b94f4737a2d3ed3144c5ef920eb82b4c6b30248eb94518b
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
