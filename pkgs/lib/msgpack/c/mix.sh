{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/msgpack/msgpack-c/archive/refs/tags/c-4.0.0.tar.gz
0fa0322f9d925fcb97c9684c571ccbcf
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
