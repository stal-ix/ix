{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
transmission
{% endblock %}

{% block version %}
4.1.4
{% endblock %}

{% block fetch %}
https://github.com/transmission/transmission/releases/download/{{self.version().strip()}}/transmission-{{self.version().strip()}}.tar.xz
86e7aa020cdf64826447034bc85f4d3b7c848d8c0891d9dc9b9fddfb2c805d22
{% endblock %}

{% block bld_libs %}
lib/c
lib/b64
lib/c++
lib/dht
lib/psl
lib/curl
lib/event
lib/natpmp
lib/kernel
lib/deflate
lib/openssl
lib/utp/new
lib/mini/upnpc
{% endblock %}

{% block cmake_flags %}
ENABLE_TESTS=OFF
ENABLE_TESTS=OFF
INSTALL_DOC=OFF
USE_SYSTEM_PSL=ON
USE_SYSTEM_EVENT2=ON
USE_SYSTEM_DEFLATE=ON
USE_SYSTEM_B64=ON
USE_SYSTEM_DHT=ON
USE_SYSTEM_UTP=ON
USE_SYSTEM_NATPMP=ON
USE_SYSTEM_MINIUPNPC=ON
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cpp_includes %}
${tmp}/obj/libtransmission
{% endblock %}
