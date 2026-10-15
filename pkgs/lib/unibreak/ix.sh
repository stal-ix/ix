{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libunibreak
{% endblock %}

{% block version %}
8.0
{% endblock %}

{% block fetch %}
https://github.com/adah1972/libunibreak/archive/refs/tags/libunibreak_{{self.version().strip().replace('.', '_')}}.tar.gz
35f1008184c13de55793fa292b62a0c10739f1294f401a3b6a772edc145a4b3b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
