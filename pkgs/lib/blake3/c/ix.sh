{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
BLAKE3
{% endblock %}

{% block version %}
1.8.1
{% endblock %}

{% block fetch %}
https://github.com/BLAKE3-team/BLAKE3/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:fc2aac36643db7e45c3653fd98a2a745e6d4d16ff3711e4b7abd3b88639463dd
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd c
{% endblock %}
