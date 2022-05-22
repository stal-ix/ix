{% extends '//lib/grpc/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
gRPC_BUILD_CODEGEN=OFF
{% endblock %}
