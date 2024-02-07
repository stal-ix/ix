{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/mesa/glu/-/archive/glu-9.0.3/glu-glu-9.0.3.tar.bz2
sha:38044ee4f255578165a54eaeb089b67fb64f7f7c0ce5fa690cd47c9df10b263c
{% endblock %}

{% block lib_deps %}
lib/c
lib/opengl
{% endblock %}

{% block setup_target_flags %}
export CXXFLAGS="-Wno-register ${CXXFLAGS}"
{% endblock %}
