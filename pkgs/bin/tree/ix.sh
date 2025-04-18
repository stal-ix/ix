{% extends '//die/c/make.sh' %}

{% block pkg_name %}
tree
{% endblock %}

{% block version %}
2.2.1
{% endblock %}

{% block fetch %}
https://github.com/Old-Man-Programmer/tree/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:5caddcbca805131ff590b126d3218019882e4ca10bc9eb490bba51c05b9b3b75
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
