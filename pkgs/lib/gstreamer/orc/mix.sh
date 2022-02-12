{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/gstreamer/orc/-/archive/0.4.32/orc-0.4.32.tar.bz2
sha:c872fc1ac747f1a8e1f42b79794a2e28f5c402b401e8cbb4a5289b2a59cc2b63
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

{% block strip_pc %}
echo 'TODO(pg): fixme'
{% endblock %}
