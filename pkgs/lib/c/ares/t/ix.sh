{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
c-ares
{% endblock %}

{% block version %}
1.34.8
{% endblock %}

{% block fetch %}
https://github.com/c-ares/c-ares/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ddf8be8b179ef6ff656e7413da93cf0f3038c627aca29ce9aae30f66e5b32bc1
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
