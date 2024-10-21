{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/FluidSynth/fluidsynth/archive/refs/tags/v2.3.7.tar.gz
sha:38d1d910783ab67c07a4d859d1aa95525979ff352b927e25b1ae894c774bb4c4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}
