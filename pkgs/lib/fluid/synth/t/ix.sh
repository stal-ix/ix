{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/FluidSynth/fluidsynth/archive/refs/tags/v2.4.1.tar.gz
sha:d1e64155ac902116ed3d4dea512719d8c04ab3877db2e8fb160284379f570a2f
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}
