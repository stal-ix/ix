{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdjson
{% endblock %}

{% block version %}
4.0.6
{% endblock %}

{% block fetch %}
https://github.com/simdjson/simdjson/archive/refs/tags/v{{self.version().strip()}}.tar.gz
84b90eaff91c8a4ac40feff1fffa9d13d706f914413dd41351644038a14079b6
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
