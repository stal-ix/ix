{% extends '//bin/grafana/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd pkg/cmd/grafana
{% endblock %}

{% block go_bins %}
grafana
{% endblock %}
