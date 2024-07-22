{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GStreamer/orc/archive/refs/tags/0.4.39.tar.gz
sha:37034939663e4eadc3d4f816fd449830c9468a69a65006d6f85b687c4a449827
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
