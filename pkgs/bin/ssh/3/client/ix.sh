{% extends '//bin/ssh/3/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd cli/client
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp client ${out}/bin/ssh3-client
{% endblock %}
