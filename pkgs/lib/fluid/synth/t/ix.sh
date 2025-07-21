{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fluidsynth
{% endblock %}

{% block version %}
2.4.7
{% endblock %}

{% block fetch %}
https://github.com/FluidSynth/fluidsynth/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7fb0e328c66a24161049e2b9e27c3b6e51a6904b31b1a647f73cc1f322523e88
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}
