{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/miniupnp/miniupnp/archive/refs/tags/miniupnpd_2_3_6.tar.gz
sha:6e5ee2239030486675f558cc840d154e5e2db9517efc96c5b0ab2b2c34c1a128
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
