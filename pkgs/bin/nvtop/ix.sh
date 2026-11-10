{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
nvtop
{% endblock %}

{% block version %}
3.4.0
{% endblock %}

{% block fetch %}
https://github.com/Syllo/nvtop/archive/refs/tags/{{self.version().strip()}}.tar.gz
7979f425dc2b748ff191e3999a0994af6154795e0e8640fae1e177684a296e08
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
lib/udev
lib/curses
{% endblock %}
