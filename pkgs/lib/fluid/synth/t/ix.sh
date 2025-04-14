{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fluidsynth
{% endblock %}

{% block version %}
2.4.5
{% endblock %}

{% block fetch %}
https://github.com/FluidSynth/fluidsynth/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:2d2a5ca35bbb3f3fd241ef388a0cb3ae5755ebbb78121c7869f02b021d694810
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}
