{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fluidsynth
{% endblock %}

{% block version %}
2.5.2
{% endblock %}

{% block git_repo %}
https://github.com/FluidSynth/fluidsynth
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
d675840ea80f812c815f34e1695660880ba6918a1dbc1ecf0ab438cdb0982abe
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}
