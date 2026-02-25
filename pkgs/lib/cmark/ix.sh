{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
cmark
{% endblock %}

{% block version %}
0.31.2
{% endblock %}

{% block fetch %}
https://github.com/commonmark/cmark/archive/refs/tags/{{self.version().strip()}}.tar.gz
f9bc5ca38bcb0b727f0056100fac4d743e768872e3bacec7746de28f5700d697
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
