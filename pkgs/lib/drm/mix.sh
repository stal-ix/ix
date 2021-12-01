{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://dri.freedesktop.org/libdrm/libdrm-2.4.109.tar.xz
376523fcbba8b9e194bcb5adff142d5d
{% endblock %}

{% block lib_deps %}
lib/linux/mix.sh
lib/atomicops/mix.sh
{% endblock %}

{% block meson_flags %}
-Dintel=false
-Dvalgrind=false
-Dudev=true
{% endblock %}
