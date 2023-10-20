{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/msquic/archive/refs/tags/v2.2.4.tar.gz
sha:44496d4663c32e8680067e08d651ec9b47cfe0c90dfd66b73c1bba3771178ec2
{% endblock %}

{% block lib_deps %}
lib/c
lib/openssl
{% endblock %}

{% block bld_libs %}
lib/kernel
lib/shim/fake(lib_name=atomic)
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
{% endblock %}

{% block cmake_flags %}
QUIC_EMBED_GIT_HASH=OFF
QUIC_USE_SYSTEM_LIBCRYPTO=ON
QUIC_SKIP_CI_CHECKS=ON
{% endblock %}

{% block patch %}
sed -e 's|QUIC_TLS STREQUAL "openssl"|0|' -i CMakeLists.txt
{% endblock %}

{% block install %}
{{super()}}
cd src/inc
cp msquic.hpp *.h ${out}/include/
cd ${out}/lib
cp libmsquic.so libmsquic.a
{% endblock %}
