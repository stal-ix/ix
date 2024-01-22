{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v1.2.0.tar.gz
sha:15f3dd4cc4db2435bcd0b5253ccce4cbab26d18cc6ef4f00b5cb4af21ed06a0b
{% endblock %}

{% block lib_deps %}
lib/c
lib/ev
lib/openssl
lib/ng/http/3
{% endblock %}

{% block cmake_flags %}
ENABLE_OPENSSL=ON
ENABLE_LIB_ONLY=OFF
ENABLE_STATIC_LIB=OFF
{% endblock %}

{% block setup %}
# for example
export CXXFLAGS="-std=c++17 ${CXXFLAGS}"
{% endblock %}

{% block patch %}
touch crypto/includes/ngtcp2/ngtcp2_crypto_openssl.h
sed -e 's|.*add_sub.*examples.*||' -i CMakeLists.txt
sed -e 's|.*add_sub.*tests.*||' -i CMakeLists.txt
{% endblock %}
