{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdjson
{% endblock %}

{% block version %}
4.6.11
{% endblock %}

{% block fetch %}
https://github.com/simdjson/simdjson/archive/refs/tags/v{{self.version().strip()}}.tar.gz
61d948fc24f0d793829ad658058e7597d064988a89b4607ea02e401a82df98ff
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
