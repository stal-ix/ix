{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Syllo/nvtop/archive/refs/tags/2.0.2.tar.gz
sha:7f22bb9f59e36551f5d7640d265b63ec6af1a91a421fa220dd913a5a134e9901
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
lib/curses
{% endblock %}
