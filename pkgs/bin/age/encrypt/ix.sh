{% extends '//bin/age/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd cmd/age
{% endblock %}

{% block go_bins %}
age
{% endblock %}
