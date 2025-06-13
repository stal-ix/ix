{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
rubberband
{% endblock %}

{% block version %}
4.0.0
{% endblock %}

{% block fetch %}
https://breakfastquay.com/files/releases/rubberband-{{self.version().strip()}}.tar.bz2
af050313ee63bc18b35b2e064e5dce05b276aaf6d1aa2b8a82ced1fe2f8028e9
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block meson_flags %}
fft=builtin
{% endblock %}
