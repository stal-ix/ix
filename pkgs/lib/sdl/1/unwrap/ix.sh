{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/sdl12-compat/archive/refs/tags/release-1.2.52.tar.gz
sha:5bd7942703575554670a8767ae030f7921a0ac3c5e2fd173a537b7c7a8599014
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
{% endblock %}
