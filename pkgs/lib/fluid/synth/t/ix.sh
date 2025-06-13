{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fluidsynth
{% endblock %}

{% block version %}
2.4.6
{% endblock %}

{% block fetch %}
https://github.com/FluidSynth/fluidsynth/archive/refs/tags/v{{self.version().strip()}}.tar.gz
a6be90fd4842b9e7246500597180af5cf213c11bfa3998a3236dd8ff47961ea8
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}
