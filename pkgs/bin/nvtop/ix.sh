{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Syllo/nvtop/archive/refs/tags/3.0.2.tar.gz
sha:
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
lib/curses
{% endblock %}
