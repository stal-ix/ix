{% extends '//bin/loki/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd cmd/logcli
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp logcli ${out}/bin/
{% endblock %}
