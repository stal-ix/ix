{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/grpc/grpc
{% endblock %}

{% block git_branch %}
v1.61.1
{% endblock %}

{% block git_sha %}
8793ab1ad283dc270b4857d1a4858d06d86e8d84c26ab3e2c335cee555b71b20
{% endblock %}

{% block git_refine %}
find . -type l -delete
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

{% block setup_target_flags %}
export CXXFLAGS="-std=c++20 ${CXXFLAGS}"
{% endblock %}

{% block patch %}
sed -e 's|std::result_of|absl::type_traits_internal::result_of|g' \
    -i src/core/lib/promise/detail/promise_like.h
{% endblock %}
