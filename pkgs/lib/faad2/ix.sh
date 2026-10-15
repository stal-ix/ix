{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
faad2
{% endblock %}

{% block version %}
2.11.4
{% endblock %}

{% block fetch %}
https://github.com/knik0/faad2/archive/refs/tags/{{self.version().strip()}}.tar.gz
ee479ccbae4a8387ab696e6f21a481bd83fe3881471cafa81b4ae59d7d3aed43
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
