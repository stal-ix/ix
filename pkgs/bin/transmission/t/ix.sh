{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/transmission/transmission/archive/refs/tags/4.0.2.tar.gz
sha:f15c4703ba97d640a4b116037216f22801e78d1660bf537486baac1794e81f6b
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
