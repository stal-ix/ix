{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/google/googletest/archive/refs/tags/v1.14.0.tar.gz
sha:8ad598c73ad796e0d8280b082cebd82a630d73e73cd3c70057938a6501bba5d7
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
