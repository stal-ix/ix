{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
CorsixTH
{% endblock %}

{% block version %}
0.70.0
{% endblock %}

{% block fetch %}
https://github.com/CorsixTH/CorsixTH/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e8f9803f6f64d23f057506202fbf275fe136c3245bab4bc19ff4c63691459cb7
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
