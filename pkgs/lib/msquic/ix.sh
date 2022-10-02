{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/msquic/archive/refs/tags/v2.1.2.tar.gz
sha:2650a4e225fff345f2e362b009f8991636d7fa6a750d681524b8636cf018961e
{% endblock %}

{% block lib_deps %}
lib/c
lib/linux
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
