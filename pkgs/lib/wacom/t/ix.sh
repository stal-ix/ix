{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-2.3.0/libwacom-2.3.0.tar.xz
sha:2fb22a7072cdbcf742d91c38246b0f91bbfd753b934ef5227e31554effb62334
{% endblock %}

{% block lib_deps %}
lib/c
lib/udev/g
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
