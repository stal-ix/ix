{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
re2c
{% endblock %}

{% block version %}
4.3
{% endblock %}

{% block fetch %}
https://github.com/skvadrik/re2c/archive/refs/tags/{{self.version().strip()}}.tar.gz
39cd7048a817cf3d7d0c2e58a52fb3597d6e1bc86b1df32b8a3cd755c458adfd
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
