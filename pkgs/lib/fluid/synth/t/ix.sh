{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fluidsynth
{% endblock %}

{% block version %}
2.4.4
{% endblock %}

{% block fetch %}
https://github.com/FluidSynth/fluidsynth/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:fc492a255f453e65ac5b99a25e6ffbe0fbd64d6a4fe824bacd68de16fe8af7ba
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}
