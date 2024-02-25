{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Syllo/nvtop/archive/refs/tags/3.1.0.tar.gz
sha:9481c45c136163574f1f16d87789859430bc90a1dc62f181b269b5edd92f01f3
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
lib/udev
lib/curses
{% endblock %}
