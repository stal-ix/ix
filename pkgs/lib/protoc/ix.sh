{% extends '//lib/protobuf/ix.sh' %}

{% block cmake_flags %}
protobuf_BUILD_LIBPROTOC=ON
{{super()}}
{% endblock %}
