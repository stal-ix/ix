{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/grpc/grpc
{% endblock %}

{% block git_branch %}
v1.62.1
{% endblock %}

{% block git_sha %}
95a9bce4e4ef6cf95d5d92eabd71409c2b881b4b71aae53ff84e4301bd68a9dc
{% endblock %}

{% block git_version %}
v3
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
