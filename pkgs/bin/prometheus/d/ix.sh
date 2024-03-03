{% extends '//bin/prometheus/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd cmd/prometheus
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp prometheus ${out}/bin/
{% endblock %}
