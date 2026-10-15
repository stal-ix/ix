{% extends '//die/c/cmake.sh' %}

# check bin/curl/ms

{% block pkg_name %}
msquic
{% endblock %}

{% block version %}
2.6.2
{% endblock %}

{% block fetch %}
https://github.com/microsoft/msquic/archive/refs/tags/v{{self.version().strip()}}.tar.gz
206e4604eb7ffbc496eb4df804afaaba4814c2bbfdb18fdb142172301b74c8c0
{% endblock %}

{% block lib_deps %}
lib/c
lib/openssl
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
{% endblock %}

{% block cmake_flags %}
QUIC_EMBED_GIT_HASH=OFF
QUIC_USE_SYSTEM_LIBCRYPTO=ON
QUIC_SKIP_CI_CHECKS=ON
{% if libopenssl_ver == '3/quic' %}
QUIC_TLS_LIB=quictls
{% else %}
QUIC_TLS_LIB=openssl
QUIC_USE_EXTERNAL_OPENSSL=ON
{% endif %}
{% endblock %}

{% block patch %}
{% if libopenssl_ver == '3/quic' %}
sed -e 's|if(QUIC_TLS_LIB STREQUAL "quictls" OR QUIC_TLS_LIB STREQUAL "openssl")|if(0)|' -i CMakeLists.txt
{% endif %}
sed -e 's|target_link_libraries(msquic_platform PUBLIC OpenSSL)|target_link_libraries(msquic_platform PUBLIC $<BUILD_LOCAL_INTERFACE:OpenSSL> $<INSTALL_INTERFACE:-lOpenSSL>)|' -i src/platform/CMakeLists.txt
sed -e 's|.*APPEND.*OTHER_TARGETS.*OpenSSL.*||' -i src/bin/CMakeLists.txt
sed -e 's|share/msquic|lib/cmake/msquic|g' -i src/bin/CMakeLists.txt
{% endblock %}

{% block install %}
{{super()}}
cd src/inc
cp msquic.hpp *.h ${out}/include/
cd ${out}/lib
ln -s . lib
{% endblock %}
