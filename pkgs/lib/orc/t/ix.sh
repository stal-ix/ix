{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GStreamer/orc/archive/refs/tags/0.4.35.tar.gz
sha:85116f6aed0a14a612548909b56da82537d1b743b14c65bfa1045db1c7703871
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
