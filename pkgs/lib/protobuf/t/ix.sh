{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
protobuf
{% endblock %}

{% block version %}
25.7
{% endblock %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:af034f71287cff2f1691649772c61b13696787a06ff616cadf9869611491fabe
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
