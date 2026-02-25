{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fluidsynth
{% endblock %}

{% block version %}
2.5.3
{% endblock %}

{% block git_repo %}
https://github.com/FluidSynth/fluidsynth
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
cab473179ca6a0f861ff7e5958a562e825ef68f4e086a51dfa6703acdb712d1e
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}
