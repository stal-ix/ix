{% extends '//die/c/cmake.sh' %}

{% block version %}
2.9.0
{% endblock %}

{% block fetch %}
https://github.com/ada-url/ada/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:8b992f0ce9134cb4eafb74b164d2ce2cb3af1900902162713b0e0c5ab0b6acd8
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block patch %}
>cmake/CPM.cmake
{% endblock %}
