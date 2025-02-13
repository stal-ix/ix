{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/contour-terminal/contour/archive/refs/tags/v0.6.1.7494.tar.gz
sha:15090a08cf05124bf05074130cc6460d1d34c6d80f1058c63202effa032b8f6f
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/gsl/ms
lib/unicode
lib/yaml/cpp
lib/range/v3
lib/freetype
lib/boxed/cpp
lib/reflection/cpp
{% endblock %}
