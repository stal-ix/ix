{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GStreamer/orc/archive/refs/tags/0.4.33.tar.gz
sha:77575c6b5436e90a24bd62ee63c98c85ce0f80f002c8edf4bd9eac3da5d6f878
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
