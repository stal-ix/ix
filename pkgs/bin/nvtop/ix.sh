{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Syllo/nvtop/archive/refs/tags/2.0.3.tar.gz
sha:ecf18c55e513fca672426cc9a3ea9ac888b4061be2cca455f484b681a1435518
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
lib/curses
{% endblock %}
