{% extends '//mix/meson.sh' %}

{% block fetch %}
https://dri.freedesktop.org/libdrm/libdrm-2.4.110.tar.xz
sha:eecee4c4b47ed6d6ce1a9be3d6d92102548ea35e442282216d47d05293cf9737
{% endblock %}

{% block lib_deps %}
lib/c
lib/linux
lib/atomicops
lib/pciaccess
{% endblock %}

{% block meson_flags %}
valgrind=false
udev=true
{% endblock %}
