{% extends '//die/proxy.sh' %}

{% set json | jl %}
[
    {"a": 1, "b": "x"},
    {"a": 2, "b": "y"}
]
{% endset %}

{% block install %}
cat << EOF
{{json | jd | lines}}
{{(json | group_by("a"))[2][0]["b"]}}
EOF
{% endblock %}
