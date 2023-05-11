{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fmtlib/fmt/archive/refs/tags/9.1.0.tar.gz
sha:5dea48d1fcddc3ec571ce2058e13910a0d4a6bab4cc09a809d8b1dd1c88ae6f2
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
