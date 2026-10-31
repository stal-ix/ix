{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdjson
{% endblock %}

{% block version %}
5.1.0
{% endblock %}

{% block fetch %}
https://github.com/simdjson/simdjson/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f413941e66142ade07adfca7c277f092f020560ea971db33414d95170afe93c4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
