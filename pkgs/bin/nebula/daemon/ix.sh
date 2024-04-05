{% extends '//bin/nebula/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd cmd/nebula
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp nebula ${out}/bin
{% endblock %}
