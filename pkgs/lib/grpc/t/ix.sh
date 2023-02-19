{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/grpc/grpc/archive/refs/tags/v1.46.7.tar.gz
sha:1f9cf306a79e9a76ff36f2f0563b72c84ab9f2592372a742a234f360ae733e54
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/re2
lib/c++
lib/c/ares
lib/openssl
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
