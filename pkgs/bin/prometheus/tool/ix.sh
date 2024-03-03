{% extends '//bin/prometheus/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd cmd/promtool
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp promtool ${out}/bin/
{% endblock %}
