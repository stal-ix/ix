{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/miniupnp/miniupnp/archive/refs/tags/miniupnpd_2_3_2.tar.gz
sha:3b8567490c50e698b91c657c5eada79d05de7d18c266bb600371707643d0ce3c
{% endblock %}

{% block unpack %}
{{super()}}
cd miniupnpc
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
UPNPC_BUILD_SAMPLE=OFF
UPNPC_BUILD_SHARED=OFF
UPNPC_BUILD_TESTS=OFF
{% endblock %}
