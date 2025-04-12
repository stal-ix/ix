{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
editorconfig-core-c
{% endblock %}

{% block version %}
0.12.6
{% endblock %}

{% block fetch %}
https://github.com/editorconfig/editorconfig-core-c/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:36052a5371731d915b53d9c7a24a11c4032585ccacb392ec9d58656eef4c0edf
{% endblock %}

{% block lib_deps %}
lib/c
lib/pcre/2
{% endblock %}
