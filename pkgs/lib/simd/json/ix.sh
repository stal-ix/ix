{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdjson
{% endblock %}

{% block version %}
5.2.0
{% endblock %}

{% block fetch %}
https://github.com/simdjson/simdjson/archive/refs/tags/v{{self.version().strip()}}.tar.gz
499176afd4b32fbe6f65551ef573b880407280072e1c19e22df0b45da58cdf64
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
