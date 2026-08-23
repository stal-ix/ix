{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ada
{% endblock %}

{% block version %}
4.0.0
{% endblock %}

{% block fetch %}
https://github.com/ada-url/ada/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6d6c7ef7dd2e329320d34eb2ab29ccdc879ee3935af9dfb894a6640e58dc381d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block patch %}
>cmake/CPM.cmake
{% endblock %}
