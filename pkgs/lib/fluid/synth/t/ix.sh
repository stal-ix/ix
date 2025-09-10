{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fluidsynth
{% endblock %}

{% block version %}
2.4.8
{% endblock %}

{% block fetch %}
https://github.com/FluidSynth/fluidsynth/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d6d04e9014557906ee42aa1fe3cd580840ea482d4c3b1a45fddd45ec606d6e97
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}
