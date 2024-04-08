{% extends '//bin/nebula/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd cmd/nebula-service
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nebula-service ${out}/bin
{% endblock %}
