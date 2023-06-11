{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/protoc
bin/grpc/codegen
{% endblock %}
