{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
toml11
{% endblock %}

{% block version %}
4.4.0
{% endblock %}

{% block fetch %}
https://github.com/ToruNiina/toml11/archive/refs/tags/v{{self.version().strip()}}.tar.gz
815bfe6792aa11a13a133b86e7f0f45edc5d71eb78f5fb6686c49c7f792b9049
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}
