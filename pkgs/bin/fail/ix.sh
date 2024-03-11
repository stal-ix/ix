{% extends '//die/proxy.sh' %}

{% block json %}
[
    {"a": 1, "b": "x"},
    {"a": 2, "b": "y"}
]
{% endblock %}

{% set kk = self.json() | jl | ser %}

{% block install %}
cat << EOF
{{(kk | des | group_by("a"))[2][0]["b"]}}
EOF
{% endblock %}
