{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ada
{% endblock %}

{% block version %}
3.2.4
{% endblock %}

{% block fetch %}
https://github.com/ada-url/ada/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:ce79b8fb0f6be6af3762a16c5488cbcd38c31d0655313a7030972a7eb2bda9e5
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block patch %}
>cmake/CPM.cmake
{% endblock %}
