{% extends '//bin/ssh/3/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd cmd/ssh3
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ssh3 ${out}/bin/
{% endblock %}
