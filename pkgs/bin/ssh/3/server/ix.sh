{% extends '//bin/ssh/3/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd cmd/ssh3-server
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ssh3-server ${out}/bin/
{% endblock %}
