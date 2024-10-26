{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/sammycage/lunasvg/archive/refs/tags/v3.0.0.tar.gz
sha:075f0a049ff205ce059feb1fe3ac0e826a1ac62d2360cb72463395f68c4c8764
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/plutovg
{% endblock %}
