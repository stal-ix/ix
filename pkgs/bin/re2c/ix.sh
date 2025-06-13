{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
re2c
{% endblock %}

{% block version %}
4.2
{% endblock %}

{% block fetch %}
https://github.com/skvadrik/re2c/archive/refs/tags/{{self.version().strip()}}.tar.gz
01b56c67ca2d5054b1aafc41ef5c15c50fbb6a7e760b1b2346e6116ef039525e
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
