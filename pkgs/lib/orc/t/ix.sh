{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GStreamer/orc/archive/refs/tags/0.4.37.tar.gz
sha:cb0a9c554c6b8da16a4a26906a9ba66df6bacc9627cc32cb51d6dc103b05f990
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
