{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/xorg/lib/libxcvt/-/archive/libxcvt-0.1.2/libxcvt-libxcvt-0.1.2.tar.bz2
sha:590e5a6da87ace7aa7857026b207a2c4d378620035441e20ea97efedd15d6d4a
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

