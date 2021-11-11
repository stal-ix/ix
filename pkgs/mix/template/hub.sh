{% extends 'base.json' %}

{% block runtime_depends %}
{% set deps %}
{% block deps %}
{% endblock %}
{% endset %}

{{mix.list_to_json(deps)}}
{% endblock %}
