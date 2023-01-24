{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/linuxwacom/libwacom/releases/download/libwacom-2.6.0/libwacom-2.6.0.tar.xz
sha:2376cca99475235b75053a2cfbc7ed40fd8763d5a516941a664870ff1f3aa98f
{% endblock %}

{% block lib_deps %}
lib/c
lib/udev/g
{% endblock %}

{% block meson_flags %}
tests=disabled
{% endblock %}
