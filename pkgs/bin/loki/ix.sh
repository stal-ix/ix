{% extends '//bin/loki/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd cmd/loki
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp loki ${out}/bin/
{% endblock %}
