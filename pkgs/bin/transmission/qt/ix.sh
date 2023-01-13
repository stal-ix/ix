{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/transmission/transmission/archive/refs/tags/4.0.0-beta.3.zip
sha:f0e4c7c7285bfe85f17b5acb51e675d000649caf838280592e3923881e23ef12
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
lib/deflate
lib/openssl
lib/utp/new
lib/utf8/cpp
lib/qt/6/base
lib/qt/6/deps
lib/fast/float
lib/mini/upnpc
lib/wide/integer
{% endblock %}

{% block cmake_flags %}
ENABLE_TESTS=OFF
ENABLE_TESTS=OFF
INSTALL_DOC=OFF
ENABLE_QT=ON
USE_QT_VERSION=6
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

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
{% endblock %}

{% block cpp_includes %}
${tmp}/obj/libtransmission
{% endblock %}
