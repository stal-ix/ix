{% extends '//die/meson.sh' %}

{% block fetch %}
https://dri.freedesktop.org/libdrm/libdrm-2.4.111.tar.xz
sha:1ad7164f77424de6f4ecba7c262bde196a214c6e19a6fbf497f0815f4d7ab2a9
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
