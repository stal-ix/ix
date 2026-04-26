{% extends '//bin/loki/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd clients/cmd/promtail
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp promtail ${out}/bin/
{% endblock %}
