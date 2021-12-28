{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://dri.freedesktop.org/libdrm/libdrm-2.4.109.tar.xz
376523fcbba8b9e194bcb5adff142d5d
{% endblock %}

{% block lib_deps %}
lib/c
lib/linux
lib/atomicops
{% endblock %}

{% block meson_flags %}
-Dintel=false
-Dvalgrind=false
-Dudev=true
{% endblock %}
