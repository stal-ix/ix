{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/miniupnp/miniupnp/archive/refs/tags/miniupnpd_2_3_3.tar.gz
sha:166277d9c1b8d8241cc6bfaa0b4b22c033bbac7f2848709685d8bfdf97778af4
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
