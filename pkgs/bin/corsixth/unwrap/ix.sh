{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
CorsixTH
{% endblock %}

{% block version %}
0.69.0
{% endblock %}

{% block fetch %}
https://github.com/CorsixTH/CorsixTH/archive/refs/tags/v{{self.version().strip()}}.tar.gz
0f2dbdc2b8b6b2e4d5e80a6be02a72d586d0072efe867750a424746bd318f1f5
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/lua
lib/curl
lib/sdl/2
lib/ffmpeg
lib/sdl/deps
lib/freetype
lib/sdl/2/mixer
lib/lua/modules/lfs/dl
{% endblock %}
