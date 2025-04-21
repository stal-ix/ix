{% extends 't/ix.sh' %}

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
