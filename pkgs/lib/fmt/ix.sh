{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/fmtlib/fmt/archive/refs/tags/9.0.0.tar.gz
sha:9a1e0e9e843a356d65c7604e2c8bf9402b50fe294c355de0095ebd42fb9bd2c5
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
FMT_TEST=OFF
FMT_FUZZ=OFF
{% endblock %}
