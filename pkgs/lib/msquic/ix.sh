{% extends '//die/c/cmake.sh' %}

# check bin/curl/ms

{% block pkg_name %}
msquic
{% endblock %}

{% block version %}
2.6.1
{% endblock %}

{% block fetch %}
https://github.com/microsoft/msquic/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f1ec3cb72955d1d5e06d8d1bf184fdc9778e6baa98410ca480ca5d94fbc414de
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
{% endblock %}

{% block patch %}
sed -e 's|QUIC_TLS STREQUAL "openssl"|0|' -i CMakeLists.txt
sed -e 's|.*APPEND.*OTHER_TARGETS.*OpenSSL.*||' -i src/bin/CMakeLists.txt
{% endblock %}

{% block install %}
{{super()}}
cd src/inc
cp msquic.hpp *.h ${out}/include/
mkdir ${out}/lib/cmake
mv ${out}/share/msquic ${out}/lib/cmake/
cd ${out}/lib
ln -s . lib
{% endblock %}
