{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Syllo/nvtop/archive/refs/tags/3.2.0.tar.gz
sha:d26df685455023cedc4dda033862dcddb67402fbdb685da70da78492f73c41d0
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
lib/udev
lib/curses
{% endblock %}
