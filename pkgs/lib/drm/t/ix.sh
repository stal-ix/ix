{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://dri.freedesktop.org/libdrm/libdrm-2.4.115.tar.xz
sha:554cfbfe0542bddb391b4e3e05bfbbfc3e282b955bd56218d21c0616481f65eb
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
