{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ada
{% endblock %}

{% block version %}
3.4.2
{% endblock %}

{% block fetch %}
https://github.com/ada-url/ada/archive/refs/tags/v{{self.version().strip()}}.tar.gz
3aceb6028eb0787ea77c8f3035a5aaa15108ab11d0fe24f23fe850cf94816523
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block patch %}
>cmake/CPM.cmake
{% endblock %}
