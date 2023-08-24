{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/transmission/transmission/archive/refs/tags/4.0.4.tar.gz
sha:767b4796a43c8bd3fc9d6c64d32dd49dedce3ad14909d6773ce2694e02b22a9d
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
