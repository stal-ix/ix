{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
re2c
{% endblock %}

{% block version %}
4.1
{% endblock %}

{% block fetch %}
https://github.com/skvadrik/re2c/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:439c5ca02f2dcc280d01054622272f34d54c05919a41859614ec386cc7f89b6d
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
