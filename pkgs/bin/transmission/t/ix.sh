{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/transmission/transmission/archive/refs/tags/4.0.1.tar.gz
sha:36377bf75cb2714a58a8bfdea2e47ad87b52238d3e05cdd8b3a154ad9c8e7937
{% endblock %}

{% block bld_libs %}
lib/c
lib/b64
lib/c++
lib/fmt
lib/dht
lib/psl
lib/curl
lib/event
lib/natpmp
lib/kernel
lib/deflate
lib/openssl
lib/utp/new
lib/utf8/cpp
lib/fast/float
lib/mini/upnpc
lib/wide/integer
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

{% block patch %}
mkdir third-party/fast_float/include
mkdir third-party/utfcpp/source
mkdir third-party/fmt/include
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cpp_includes %}
${tmp}/obj/libtransmission
{% endblock %}
