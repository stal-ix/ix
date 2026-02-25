{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
CorsixTH
{% endblock %}

{% block version %}
0.69.2
{% endblock %}

{% block fetch %}
https://github.com/CorsixTH/CorsixTH/archive/refs/tags/v{{self.version().strip()}}.tar.gz
cbad15f9a16edd4c068ce14fb17f39cdb811dab0135fca80fafffa9a45732aec
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
