{% extends '//bin/ssh/3/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd cli/server
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp server ${out}/bin/ssh3-server
{% endblock %}
