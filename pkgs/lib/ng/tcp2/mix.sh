{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v0.2.1.tar.gz
sha:5f54a39662b31f5fe08132963c8b442397e04f6d47c9597beaba9c086e7fbc9a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
ENABLE_LIB_ONLY=OFF
ENABLE_STATIC_LIB=OFF
{% endblock %}
