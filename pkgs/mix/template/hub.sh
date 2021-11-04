{% set deps %}
{% block deps %}
{% endblock %}
{% endset %}

{
    "runtime": {
        "depends": {{mix.list_to_json(deps)}}
    }
}
