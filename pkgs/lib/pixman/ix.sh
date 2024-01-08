{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.cairographics.org/releases/pixman-0.43.0.tar.gz
sha:a65c28209858fb16bee50d809c80f90a8e415c0e4fd8321078a1822785a5560a
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
