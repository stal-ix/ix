{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Esri/lerc/archive/refs/tags/v4.0.0.tar.gz
sha:91431c2b16d0e3de6cbaea188603359f87caed08259a645fd5a3805784ee30a0
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
