{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
libconfig
{% endblock %}

{% block version %}
1.7.3
{% endblock %}

{% block fetch %}
https://github.com/hyperrealm/libconfig/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:68757e37c567fd026330c8a8449aa5f9cac08a642f213f2687186b903bd7e94e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BUILD_EXAMPLES=OFF
BUILD_TESTS=OFF
{% endblock %}
