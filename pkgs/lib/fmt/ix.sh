{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fmtlib/fmt/archive/refs/tags/10.0.0.tar.gz
sha:ede1b6b42188163a3f2e0f25ad5c0637eca564bd8df74d02e31a311dd6b37ad8
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block cmake_flags %}
FMT_DOC=OFF
FMT_TEST=OFF
FMT_FUZZ=OFF
{% endblock %}
