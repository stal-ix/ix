{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/FluidSynth/fluidsynth/archive/refs/tags/v2.3.4.tar.gz
sha:1529ef5bc3b9ef3adc2a7964505912f7305103e269e50cc0316f500b22053ac9
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}
