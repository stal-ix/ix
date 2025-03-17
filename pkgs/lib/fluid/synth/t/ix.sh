{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/FluidSynth/fluidsynth/archive/refs/tags/v2.4.4.tar.gz
sha:fc492a255f453e65ac5b99a25e6ffbe0fbd64d6a4fe824bacd68de16fe8af7ba
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}
