{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/grpc/grpc
{% endblock %}

{% block git_branch %}
v1.55.1
{% endblock %}

{% block git_sha %}
dd521a463021796638803d4e8ea2dcf0739758ed0d5d80e67ad29f9f20327139
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
