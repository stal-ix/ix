{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GStreamer/orc/archive/refs/tags/0.4.34.tar.gz
sha:e751284f6d063c49ce81a2b45efdbbd8b84141f69da029b5189448b9fb3f25aa
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
