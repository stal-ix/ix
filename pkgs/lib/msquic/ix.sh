{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/msquic/archive/refs/tags/v2.3.1.tar.gz
sha:d7ed6be7eadefdb5453dfb51c1f75f9cbbad2783294e61e9f7429beacdf0ae53
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
{% endblock %}
