{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
reflection-cpp
{% endblock %}

{% block version %}
0.5.0
{% endblock %}

{% block fetch %}
https://github.com/contour-terminal/reflection-cpp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
37fdef7b434e53e554db9b348ecc3c5cf83d281c193bcf3fdc79072cee692d05
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
