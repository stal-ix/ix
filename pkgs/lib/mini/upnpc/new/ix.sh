{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/miniupnp/miniupnp/archive/refs/tags/miniupnpd_2_3_4.tar.gz
sha:4686ff5a071fa58d50c1e0b81d447851dd9ea509c9cc82f0ceb4286473919ce9
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
