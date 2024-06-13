{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v1.6.0.tar.gz
sha:6bd3dbf2943500223b850602c73ce74fd6863c435e3a77fb03d93ba0a3d1d21a
{% endblock %}

{% block lib_deps %}
lib/c
lib/ev
lib/openssl
lib/ng/http/3
{% endblock %}

{% block cmake_flags %}
ENABLE_OPENSSL=ON
ENABLE_STATIC_LIB=ON
ENABLE_SHARED_LIB=OFF
{% endblock %}

{% block setup_target_flags %}
# for example
export CXXFLAGS="-std=c++17 ${CXXFLAGS}"
{% endblock %}

{% block patch %}
touch crypto/includes/ngtcp2/ngtcp2_crypto_openssl.h
sed -e 's|.*add_sub.*examples.*||' -i CMakeLists.txt
sed -e 's|.*add_sub.*tests.*||' -i CMakeLists.txt
{% endblock %}
