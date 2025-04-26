{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ada
{% endblock %}

{% block version %}
3.2.3
{% endblock %}

{% block fetch %}
https://github.com/ada-url/ada/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:8b9aa4dff92772d0029d8bc1f3f704afe34a899e23334bf04c7f0d019a5071c2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block patch %}
>cmake/CPM.cmake
{% endblock %}
