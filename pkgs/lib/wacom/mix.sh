{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-2.2.0/libwacom-2.2.0.tar.xz
sha:e62ac9edb522d36ad2fa99adca35ddc02067383d4668eeaa13d7efccc30bb8c8
{% endblock %}

{% block lib_deps %}
lib/c
lib/udev/g
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
