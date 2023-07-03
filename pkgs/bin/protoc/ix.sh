{% extends '//lib/protobuf/t/ix.sh' %}

{% block env %}
{{super()}}
export PROTOC_EXE=${out}/bin/protoc
{% endblock %}
