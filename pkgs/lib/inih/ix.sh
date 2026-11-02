{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
inih
{% endblock %}

{% block version %}
63
{% endblock %}

{% block fetch %}
https://github.com/benhoyt/inih/archive/refs/tags/r{{self.version().strip()}}.tar.gz
5d7967de62c5bfdc4f9f5ab06ce44c9e498bae021c7dac5792c0696e76aa9963
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
