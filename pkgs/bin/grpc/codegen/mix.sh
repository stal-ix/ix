{% extends '//lib/grpc/t/mix.sh' %}

{% block bld_tool %}
bin/protoc
{{super()}}
{% endblock %}

{% block cmake_flags %}
{{super()}}
gRPC_BUILD_CODEGEN=ON
{% endblock %}
