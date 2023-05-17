{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-2.7.0/libwacom-2.7.0.tar.xz
sha:853929bd73fba2064b12142dbbee4b3bf84509197ff46a4da559eddf62d32cdf
{% endblock %}

{% block lib_deps %}
lib/c
lib/udev/g
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
