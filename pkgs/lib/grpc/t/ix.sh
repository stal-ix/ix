{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/grpc/grpc
{% endblock %}

{% block git_branch %}
v1.59.2
{% endblock %}

{% block git_sha %}
d87b80267701bf8444b8f09abede20ebae6fc1f9e31cc0f5d3078771c7041a13
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
