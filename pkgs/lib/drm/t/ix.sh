{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://dri.freedesktop.org/libdrm/libdrm-2.4.119.tar.xz
sha:0a49f12f09b5b6e68eaaaff3f02ca7cff9aa926939b212d343161d3e8ac56291
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
