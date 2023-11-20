{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://dri.freedesktop.org/libdrm/libdrm-2.4.118.tar.xz
sha:a777bd85f2b5fc9c57f886c82058300578317cafdbc77d0a769d7e9a9567ab88
{% endblock %}

{% block lib_deps %}
lib/c
lib/kernel
lib/pciaccess
{% if not x86_64 %}
lib/atomic/ops
{% endif %}
{% endblock %}

{% block meson_flags %}
udev=true
valgrind=disabled
{% endblock %}
