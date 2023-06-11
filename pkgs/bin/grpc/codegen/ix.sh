{% extends '//lib/grpc/t/ix.sh' %}

{% block bld_tool %}
bin/protoc
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/protoc
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
gRPC_BUILD_CODEGEN=ON
_gRPC_PROTOBUF_PROTOC_EXECUTABLE=protoc
{% endblock %}
