{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/grpc/grpc/archive/refs/tags/v1.46.7.tar.gz
sha:1f9cf306a79e9a76ff36f2f0563b72c84ab9f2592372a742a234f360ae733e54
#https://github.com/grpc/grpc/archive/refs/tags/v1.52.1.tar.gz
#sha:ec125d7fdb77ecc25b01050a0d5d32616594834d3fe163b016768e2ae42a2df6
#https://github.com/census-instrumentation/opencensus-proto/archive/v0.3.0.tar.gz
#sha:b7e13f0b4259e80c3070b583c2f39e53153085a6918718b1c710caf7037572b0
{% endblock %}

{% block unpack1 %}
mkdir src; cd src
extract 0 ${src}/v1*
cd grpc*
(
    mkdir -p ${tmp}/obj/http_archives/opencensus-proto-0.3.0
    cp ${src}/v0* ${tmp}/obj/http_archives/opencensus-proto-0.3.0/src.tar.gz
)
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
