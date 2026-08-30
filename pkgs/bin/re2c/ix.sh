{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
re2c
{% endblock %}

{% block version %}
4.5.1
{% endblock %}

{% block fetch %}
https://github.com/skvadrik/re2c/archive/refs/tags/{{self.version().strip()}}.tar.gz
d89c5d795e67423282fd1c8245eb37047eafabf78231a63d4c1c13aefcee9a2b
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block std_box %}
{{super()}}
bld/python
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
