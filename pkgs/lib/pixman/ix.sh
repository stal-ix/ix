{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.cairographics.org/releases/pixman-0.43.2.tar.gz
sha:ea79297e5418fb528d0466e8b5b91d1be88857fa3706f49777b2925a72ae9924
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/pixman-1 \${CPPFLAGS}"
{% endblock %}

{% block meson_flags %}
{% if aarch64 or arm64 %}
gnu-inline-asm=disabled
arm-simd=disabled
neon=disabled
a64-neon=disabled
{% endif %}
{% endblock %}
