{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/sammycage/lunasvg/archive/refs/tags/v2.3.9.tar.gz
sha:088bc9fd1191a004552c65bdcc260989b83da441b0bdaa965e79d984feba88fa
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
