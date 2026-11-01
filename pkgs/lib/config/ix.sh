{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libconfig
{% endblock %}

{% block version %}
1.8.3
{% endblock %}

{% block fetch %}
https://github.com/hyperrealm/libconfig/archive/refs/tags/v{{self.version().strip()}}.tar.gz
683f723d647befcdb36e1a4a61a83ae8c89dc7959ca872a7407b6c8152104162
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BUILD_EXAMPLES=OFF
BUILD_TESTS=OFF
{% endblock %}
