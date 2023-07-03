{% extends 't/ix.sh' %}

{% block cmake_flags %}
protobuf_BUILD_PROTOC_BINARIES=OFF
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|protobuf::protoc|protoc|' -i ${out}/lib/cmake/protobuf/protobuf-generate.cmake
{% endblock %}
