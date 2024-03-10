{% extends '//die/proxy.sh' %}

{% block json %}
[
    {"a": 1, "b": "x"},
    {"a": 2, "b": "y"}
]
{% endblock %}

{% block install %}
cat << EOF
{{(self.json() | jl | group_by("a"))[2][0]["b"]}}
EOF
{% endblock %}
