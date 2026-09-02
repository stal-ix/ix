{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
CorsixTH
{% endblock %}

{% block version %}
0.70.1
{% endblock %}

{% block fetch %}
https://github.com/CorsixTH/CorsixTH/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b3a37b09f168f30600d305314f5a823d3af10bf407074e9a837e0e85acfe9ba3
{% endblock %}

{% block cmake_flags %}
WITH_MIDI_DEVICE=OFF
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
