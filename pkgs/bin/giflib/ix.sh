{% extends '//lib/gif/ix.sh' %}

{% block patch %}
{{super()}}
{% if wasi %}
echo 'int main() {}' > gifinto.c
{% endif %}
{% endblock %}
