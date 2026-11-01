{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
iniparser
{% endblock %}

{% block version %}
4.3.2
{% endblock %}

{% block fetch %}
https://github.com/ndevilla/iniparser/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e9eb6be555c30fbef87e5a07333fcff6ef8c5bbbdc5710321bbad7ebae0612a7
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BUILD_EXAMPLES=OFF
BUILD_DOCS=OFF
{% endblock %}
