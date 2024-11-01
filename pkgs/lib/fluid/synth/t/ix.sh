{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/FluidSynth/fluidsynth/archive/refs/tags/v2.4.0.tar.gz
sha:fd4d216a3030abc56a339985ab0506328660cd77b2d71dd98c240c58c03d8f7f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}
