{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pixman
{% endblock %}

{% block version %}
0.46.2
{% endblock %}

{% block fetch %}
https://www.cairographics.org/releases/pixman-{{self.version().strip()}}.tar.gz
3e0de5ba6e356916946a3d958192f15505dcab85134771bfeab4ce4e29bbd733
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
