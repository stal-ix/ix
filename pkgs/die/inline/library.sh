{% extends 'common.sh' %}

{% block build %}
{{super()}}
ar -q lib{{uniq_id}}.a *.o
{% endblock %}
