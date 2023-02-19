{% extends 't/ix.sh' %}

{% block cmake_flags %}
protobuf_BUILD_PROTOC_BINARIES=OFF
{{super()}}
{% endblock %}
