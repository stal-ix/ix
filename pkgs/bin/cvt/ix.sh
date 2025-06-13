{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libxcvt
{% endblock %}

{% block version %}
0.1.3
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/xorg/lib/libxcvt/-/archive/libxcvt-{{self.version().strip()}}/libxcvt-libxcvt-{{self.version().strip()}}.tar.bz2
1568702e1b62f4a82c97b3e072e038d5f6123f190e2d220e29f63a8fe29d3943
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
