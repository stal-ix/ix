{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/contour-terminal/reflection-cpp/archive/refs/tags/v0.1.0.tar.gz
sha:fa0bd57281d82ea0f72edcbd499a854b97ab4520b062c9ee15efd3fc091b38a0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
