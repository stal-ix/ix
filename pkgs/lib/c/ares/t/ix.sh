{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/c-ares/c-ares/archive/refs/tags/v1.34.2.tar.gz
sha:ddedac85d77662a88501f07fc9cbae18df8f30850d97ec6432f092b933e32922
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
