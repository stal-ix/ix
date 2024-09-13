{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/gstreamer/orc/-/archive/0.4.40/orc-0.4.40.tar.bz2
sha:cee70f3c101ecd78ed3e400c32d62d2202dadb1cb13f0e7f32ade4b8d6f740e9
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block step_patch %}
: skip it
{% endblock %}

{% block meson_flags %}
orc-test=disabled
benchmarks=disabled
examples=disabled
tests=disabled
{% endblock %}
