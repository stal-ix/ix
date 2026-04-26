{% extends '//bin/nebula/ng/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd cmd/nebula-cert
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nebula-cert ${out}/bin
{% endblock %}
