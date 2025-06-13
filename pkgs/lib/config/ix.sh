{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libconfig
{% endblock %}

{% block version %}
1.8.1
{% endblock %}

{% block fetch %}
https://github.com/hyperrealm/libconfig/archive/refs/tags/v{{self.version().strip()}}.tar.gz
e95798d2992a66ecd547ce3651d7e10642ff2211427c43a7238186ff4c372627
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BUILD_EXAMPLES=OFF
BUILD_TESTS=OFF
{% endblock %}
