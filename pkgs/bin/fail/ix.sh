{% extends '//die/proxy.sh' %}

{% set data %}
[
    {"a": 1, "b": "x"},
    {"a": 2, "b": "y"}
]
{% endset %}

{% set prog %}
import json

def do(data, arg):
    print(arg)
    return json.loads(data)
{% endset %}

{% set json = data | eval(prog, "qw") %}

{% block install %}
cat << EOF
{{json | jd | lines}}
{{(json | group_by("a"))[2][0]["b"]}}
EOF
{% endblock %}
