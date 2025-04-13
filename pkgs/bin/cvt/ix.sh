{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libxcvt
{% endblock %}

{% block version %}
0.1.2
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/xorg/lib/libxcvt/-/archive/libxcvt-{{self.version().strip()}}/libxcvt-libxcvt-{{self.version().strip()}}.tar.bz2
sha:590e5a6da87ace7aa7857026b207a2c4d378620035441e20ea97efedd15d6d4a
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
