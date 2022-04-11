{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/libgit2/libgit2/archive/refs/tags/v1.4.2.tar.gz
sha:901c2b4492976b86477569502a41c31b274b69adc177149c02099ea88404ef19
{% endblock %}

{% block lib_deps %}
lib/c
lib/openssl
{% endblock %}

{% block cmake_flags %}
BUILD_TESTS=OFF
{% endblock %}
