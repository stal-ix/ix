{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
iniparser
{% endblock %}

{% block version %}
4.3.0
{% endblock %}

{% block fetch %}
https://github.com/ndevilla/iniparser/archive/refs/tags/v{{self.version().strip()}}.tar.gz
97375d6a3c481ebb27c47884aa57934599eed027a3015225e2f13173efd39643
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BUILD_EXAMPLES=OFF
BUILD_DOCS=OFF
{% endblock %}
