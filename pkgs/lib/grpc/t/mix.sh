{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/grpc/grpc/archive/refs/tags/v1.46.2.tar.gz
sha:64b791c3dad387230f8b46cbd0c474b6ae751f7f805d05cb3bae36ac0ff2a7e7
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/re2
lib/c++
lib/c-ares
lib/openssl
lib/protobuf
lib/abseil/cpp
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
gRPC_ABSL_PROVIDER=package
gRPC_ZLIB_PROVIDER=package
gRPC_CARES_PROVIDER=package
gRPC_RE2_PROVIDER=package
gRPC_SSL_PROVIDER=package
gRPC_PROTOBUF_PROVIDER=package
gRPC_BUILD_CSHARP_EXT=OFF
{% endblock %}

{% block setup %}
export CXXFLAGS="-std=c++20 ${CXXFLAGS}"
{% endblock %}
