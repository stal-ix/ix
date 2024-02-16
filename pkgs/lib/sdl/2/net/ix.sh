{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/libsdl-org/SDL_net/archive/refs/tags/release-2.2.0.tar.gz
sha:08d741282c0c22b82ed134f09cd319803132289cae06fb47b5ada2752faf0493
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/sdl/2
{% endblock %}

{% block cmake_flags %}
SDL2NET_SAMPLES=OFF
{% endblock %}
