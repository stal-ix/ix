{% extends '//lib/giflib/ix.sh' %}

{% block patch %}
{{super()}}
{% if wasi %}
echo 'int main() {}' > gifinto.c
{% endif %}
{% endblock %}
