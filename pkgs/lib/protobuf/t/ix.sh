{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
protobuf
{% endblock %}

{% block version %}
30.2
{% endblock %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:07a43d88fe5a38e434c7f94129cad56a4c43a51f99336074d0799c2f7d4e44c5
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
lib/abseil/cpp
{% endblock %}

{% block cmake_flags %}
protobuf_BUILD_TESTS=OFF
protobuf_ABSL_PROVIDER=package
{% endblock %}

{% block patch %}
{% if mingw32 %}
cat << EOF >> src/google/protobuf/port_def.inc
#undef PROTOBUF_DESCRIPTOR_WEAK_MESSAGES_ALLOWED
EOF
{% endif %}
{% endblock %}
