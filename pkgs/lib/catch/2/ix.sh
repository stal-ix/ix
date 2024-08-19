{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/catchorg/Catch2/archive/refs/tags/v3.7.0.tar.gz
sha:5b10cd536fa3818112a82820ce0787bd9f2a906c618429e7c4dea639983c8e88
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}


