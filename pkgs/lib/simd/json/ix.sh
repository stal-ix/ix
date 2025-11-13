{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
simdjson
{% endblock %}

{% block version %}
4.2.2
{% endblock %}

{% block fetch %}
https://github.com/simdjson/simdjson/archive/refs/tags/v{{self.version().strip()}}.tar.gz
3efae22cb41f83299fe0b2e8a187af543d3dda93abbb910586f897df670f9eaa
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
