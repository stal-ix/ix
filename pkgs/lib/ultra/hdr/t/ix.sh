{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libultrahdr
{% endblock %}

{% block version %}
1.4.0
{% endblock %}

{% block fetch %}
https://github.com/google/libultrahdr/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e7e1252e2c44d8ed6b99ee0f67a3caf2d8a61c43834b13b1c3cd485574c03ab9
{% endblock %}

{% block lib_deps %}
lib/c
lib/jpeg
{% endblock %}
