{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
c-ares
{% endblock %}

{% block version %}
1.34.6
{% endblock %}

{% block fetch %}
https://github.com/c-ares/c-ares/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4358939ff800b13b92f37d5fdda003718101faedfbdee792d6b79ddc1a53d890
{% endblock %}

{% block lib_deps %}
lib/c
{% if mingw32 %}
lib/shim/dll(dll_name=iphlpapi)
{% endif %}
{% if darwin %}
lib/darwin/framework/SystemConfiguration
{% endif %}
{% endblock %}

{% block cmake_flags %}
CARES_STATIC=ON
CARES_SHARED=OFF
{% endblock %}
