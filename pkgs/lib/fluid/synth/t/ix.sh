{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/FluidSynth/fluidsynth/archive/refs/tags/v2.3.6.tar.gz
sha:3340d73286b28fe6e5150fbe12648d4640e86c64c228878b572773bd08cac531
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}
