{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libconfig
{% endblock %}

{% block version %}
1.8.2
{% endblock %}

{% block fetch %}
https://github.com/hyperrealm/libconfig/archive/refs/tags/v{{self.version().strip()}}.tar.gz
8e71983761b08c65b15b769b3ec1d980036c461fdfd415c7183378a4b3eac8f4
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BUILD_EXAMPLES=OFF
BUILD_TESTS=OFF
{% endblock %}
