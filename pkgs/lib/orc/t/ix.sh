{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
orc
{% endblock %}

{% block version %}
0.4.41
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/gstreamer/orc/-/archive/0.4.40/orc-{{self.version().strip()}}.tar.bz2
sha:29b6114976f0cd50b78eeb2cce06bf3436f2d72ea787a1b03317ac01bac96432
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
