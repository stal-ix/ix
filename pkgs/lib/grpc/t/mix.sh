{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/grpc/grpc/archive/refs/tags/v1.45.2.tar.gz
sha:e18b16f7976aab9a36c14c38180f042bb0fd196b75c9fd6a20a2b5f934876ad6
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
