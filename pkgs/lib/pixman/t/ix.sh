{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pixman
{% endblock %}

{% block version %}
0.46.4
{% endblock %}

{% block fetch %}
https://www.cairographics.org/releases/pixman-{{self.version().strip()}}.tar.gz
d09c44ebc3bd5bee7021c79f922fe8fb2fb57f7320f55e97ff9914d2346a591c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
{% if riscv64 %}
lib/kernel
{% endif %}
{% endblock %}

{% block meson_flags %}
{% if aarch64 or arm64 %}
gnu-inline-asm=disabled
arm-simd=disabled
neon=disabled
a64-neon=disabled
{% endif %}
{% endblock %}
