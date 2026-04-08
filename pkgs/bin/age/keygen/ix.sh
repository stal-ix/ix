{% extends '//bin/age/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd cmd/age-keygen
{% endblock %}

{% block go_bins %}
age-keygen
{% endblock %}
