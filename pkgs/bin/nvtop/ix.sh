{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Syllo/nvtop/archive/refs/tags/3.0.2.tar.gz
sha:63fa45a2d675fe5320704850c216da6a6bb2edaf09821c26b3800fa7744bae00
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
lib/udev
lib/curses
{% endblock %}
