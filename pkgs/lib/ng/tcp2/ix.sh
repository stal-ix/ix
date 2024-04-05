{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v1.4.0.tar.gz
sha:c9678997e5ec9b7e35458419f7482440a3161ed1ed06e2882d324a69113fe52d
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
