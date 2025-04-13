{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
glu
{% endblock %}

{% block version %}
9.0.3
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/mesa/glu/-/archive/glu-{{self.version().strip()}}/glu-glu-{{self.version().strip()}}.tar.bz2
sha:38044ee4f255578165a54eaeb089b67fb64f7f7c0ce5fa690cd47c9df10b263c
{% endblock %}

{% block lib_deps %}
lib/c
lib/opengl
{% endblock %}
