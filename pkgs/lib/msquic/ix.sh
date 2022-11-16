{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/msquic/archive/refs/tags/v2.1.5.tar.gz
sha:55932998573ad19f0e96de7cb15900e36cbfef1d41a32f501cef4205b97c9ba9
{% endblock %}

{% block lib_deps %}
lib/c
lib/kernel
lib/openssl
{% endblock %}

{% block build_flags %}
wrap_cc
shut_up
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
