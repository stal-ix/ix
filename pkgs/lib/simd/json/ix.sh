{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdjson
{% endblock %}

{% block version %}
4.6.9
{% endblock %}

{% block fetch %}
https://github.com/simdjson/simdjson/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b3954b7d6024eb5063c64e47be5ca09be04a3783563340400ce0aef416b20216
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
