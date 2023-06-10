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
_gRPC_CPP_PLUGIN=grpc_cpp_plugin
_gRPC_PROTOBUF_PROTOC_EXECUTABLE=protoc
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|EXPORT gRPCPluginTargets|EXPORT gRPCTargets|' -i CMakeLists.txt
{% endblock %}
