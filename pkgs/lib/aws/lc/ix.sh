{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/aws/aws-lc/archive/refs/tags/v1.63.0.tar.gz
8cbfe34e49c9a8ab836a72173e8b919b12dc9605252f25c667358ddc3f2d9c6b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BUILD_TESTING=OFF
DISABLE_PERL=ON
DISABLE_GO=ON
{% endblock %}

{% block patch %}
sed -e 's|.*#error.*||' \
    -i third_party/jitterentropy/jitterentropy-library/src/jitterentropy-base.c
{% endblock %}
