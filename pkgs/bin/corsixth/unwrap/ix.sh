{% extends '//die/c/cmake.sh' %}

{% block version %}
0.67
{% endblock %}

{% block fetch %}
https://github.com/CorsixTH/CorsixTH/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:4e88cf1916bf4d7c304b551ddb91fb9194f110bad4663038ca73d31b939d69e3
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/lua
lib/sdl/2
lib/ffmpeg
lib/sdl/deps
lib/freetype
lib/sdl/2/mixer
lib/lua/modules/lfs/dl
{% endblock %}
