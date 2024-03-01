{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.cairographics.org/releases/pixman-0.43.4.tar.gz
sha:a0624db90180c7ddb79fc7a9151093dc37c646d8c38d3f232f767cf64b85a226
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
