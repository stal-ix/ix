{% extends '//die/c/cmake.sh' %}

{% block fetch %}
{% include '//lib/mini/upnpc/new/ver.sh' %}
{% endblock %}

{% block unpack %}
{{super()}}
cd miniupnpc
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block cmake_flags %}
UPNPC_BUILD_SAMPLE=ON
UPNPC_BUILD_SHARED=OFF
UPNPC_BUILD_TESTS=OFF
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/bin/upnp-listdevices-static ${out}/bin/upnp-listdevices
mv ${out}/bin/upnpc-static ${out}/bin/upnpc
{% endblock %}
