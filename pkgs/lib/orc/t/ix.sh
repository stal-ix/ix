{% extends '//die/c/meson.sh' %}

{% block fetch %}
#https://gitlab.freedesktop.org/gstreamer/orc/-/archive/0.4.32/orc-0.4.32.tar.bz2
#sha:8a86df9cfbdc5527e95f789eee0212928324a69bc6ca69d24d0a5cf8744cb467
https://github.com/GStreamer/orc/archive/refs/tags/0.4.32.tar.gz
sha:6a7349d2ab4a73476cd4de36212e8c3c6524998081aaa04cf3a891ef792dd50f
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
