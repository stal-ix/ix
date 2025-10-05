{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
editorconfig-core-c
{% endblock %}

{% block version %}
0.12.10
{% endblock %}

{% block fetch %}
https://github.com/editorconfig/editorconfig-core-c/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ab9f897a90fb36cfc34e5b67221e55ab0e3119b3512de8e31029d376c6bab870
{% endblock %}

{% block lib_deps %}
lib/c
lib/pcre/2
{% endblock %}
