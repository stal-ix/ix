{% extends '//die/cmake.sh' %}

{% block fetch %}
#https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v0.5.0.tar.gz
#sha:e9613c4dc1c5bfcb6e1b2d9f5573b32520bd006dc7f12aaf3f91bcb5805f202f
https://github.com/ngtcp2/ngtcp2/archive/refs/tags/v0.6.0.tar.gz
sha:b562f99fdb8129121970ea89286a31d21d4e9a8752cf96e2248cc5486c48f37a
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
