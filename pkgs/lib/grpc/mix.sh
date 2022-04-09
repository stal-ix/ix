{% extends '//lib/grpc/t/mix.sh' %}

{% block cmake_flags %}
{{super()}}
gRPC_BUILD_CODEGEN=OFF
{% endblock %}
