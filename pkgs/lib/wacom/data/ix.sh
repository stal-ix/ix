{% extends '//lib/wacom/t/ix.sh' %}

{% block env %}
export WACOM_DATA="${out}"
{% endblock %}
