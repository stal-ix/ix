{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
uncrustify
{% endblock %}

{% block version %}
0.83.0
{% endblock %}

{% block fetch %}
https://github.com/uncrustify/uncrustify/archive/refs/tags/uncrustify-{{self.version().strip()}}.tar.gz
1d4d3ab3a991c66eb24cb0a3e690573b4882fd98bc6ec64a01c283998c20dc87
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}
