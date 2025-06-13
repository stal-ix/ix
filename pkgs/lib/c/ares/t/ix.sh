{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
c-ares
{% endblock %}

{% block version %}
1.34.5
{% endblock %}

{% block fetch %}
https://github.com/c-ares/c-ares/archive/refs/tags/v{{self.version().strip()}}.tar.gz
dcd919635f01b7c8c9c2f5fb38063cd86500f7c6d4d32ecf4deff5e3497fb157
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
