{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
re2c
{% endblock %}

{% block version %}
4.6
{% endblock %}

{% block fetch %}
https://github.com/skvadrik/re2c/archive/refs/tags/{{self.version().strip()}}.tar.gz
39af7f5ccaa0b7cf8105fa59a02566b52bc8844e59982133165487ffd1cfc6cc
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
