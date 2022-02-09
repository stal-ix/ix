{% extends '//bin/sway/mix.sh' %}

{% block patch %}
{{super()}}
base64 -d << EOF > sway/commands/exec_always.c
{% include 'exec_always.c/base64' %}
EOF
{% endblock %}
