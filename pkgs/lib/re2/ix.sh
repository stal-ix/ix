{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/re2/archive/refs/tags/2023-09-01.tar.gz
sha:5bb6875ae1cd1e9fedde98018c346db7260655f86fdb8837e3075103acd3649b
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
