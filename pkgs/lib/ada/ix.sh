{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ada
{% endblock %}

{% block version %}
4.1.1
{% endblock %}

{% block fetch %}
https://github.com/ada-url/ada/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ed818cfe260ec063e1f1d93fdafca4d158162ba515369bef085adc366a03a41c
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block patch %}
>cmake/CPM.cmake
{% endblock %}
