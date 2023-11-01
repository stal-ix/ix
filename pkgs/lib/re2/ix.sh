{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/re2/archive/refs/tags/2023-11-01.tar.gz
sha:4e6593ac3c71de1c0f322735bc8b0492a72f66ffccfad76e259fa21c41d27d8a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/abseil/cpp
{% endblock %}

{% block cmake_flags %}
RE2_BUILD_TESTING=OFF
{% endblock %}

{% block env %}
export CMFLAGS="-Dre2_DIR=${out}/lib/cmake/re2 \${CMFLAGS}"
{% endblock %}
