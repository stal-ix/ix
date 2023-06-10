{% extends '//lib/grpc/t/ix.sh' %}

{% block lib_deps %}
lib/protobuf
{{super()}}
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/protoc
bin/grpc/codegen
{% endblock %}

{% block cmake_flags %}
{{super()}}
gRPC_BUILD_CODEGEN=OFF
{% endblock %}
