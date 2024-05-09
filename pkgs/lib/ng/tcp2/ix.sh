{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v1.5.0.tar.gz
sha:7545d489e91749d30e337e32cfafb002afcf289796b1799fa451650c6c0fd32e
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
