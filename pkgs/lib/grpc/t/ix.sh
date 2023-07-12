{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/grpc/grpc
{% endblock %}

{% block git_branch %}
v1.56.1
{% endblock %}

{% block git_sha %}
2b0e61cfda2db1afa4e0fcab2af82ac1e7ac8331d114471c8f58962e4a0e4901
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
