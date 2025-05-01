{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
pixman
{% endblock %}

{% block version %}
0.46.0
{% endblock %}

{% block fetch %}
https://www.cairographics.org/releases/pixman-{{self.version().strip()}}.tar.gz
sha:02d9ff7b8458ef61731c3d355f854bbf461fd0a4d3563c51f1c1c7b00638050d
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
