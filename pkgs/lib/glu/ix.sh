{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/mesa/glu/-/archive/glu-9.0.2/glu-glu-9.0.2.tar.bz2
sha:67f446cbbb9787f8392b03c111638974c5e50c969849720fff950b7bafbf54bd
{% endblock %}

{% block lib_deps %}
lib/c
lib/opengl
{% endblock %}

{% block setup %}
export CXXFLAGS="-Wno-register ${CXXFLAGS}"
{% endblock %}
