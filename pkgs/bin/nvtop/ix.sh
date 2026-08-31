{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
nvtop
{% endblock %}

{% block version %}
3.3.2
{% endblock %}

{% block fetch %}
https://github.com/Syllo/nvtop/archive/refs/tags/{{self.version().strip()}}.tar.gz
48a295f3b3a917cc851d1aa8b185c09fde3a1b1e741fc57d7fa96b3671271630
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
lib/udev
lib/curses
{% endblock %}
