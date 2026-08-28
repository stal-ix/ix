{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
editorconfig-core-c
{% endblock %}

{% block version %}
0.12.11
{% endblock %}

{% block fetch %}
https://github.com/editorconfig/editorconfig-core-c/archive/refs/tags/v{{self.version().strip()}}.tar.gz
9d8b420b56a969ea3cf784861c72d26fa0e158fa1494d732df2c8a1480d36a5c
{% endblock %}

{% block lib_deps %}
lib/c
lib/pcre/2
{% endblock %}
