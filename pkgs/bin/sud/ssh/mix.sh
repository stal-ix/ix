{% extends '//bin/dropbear/mix.sh' %}

{% block install %}
{{super()}}

cd ${out}/bin

rm dropbearconvert dropbearkey

mv dbclient db_client
mv dropbear db_server
{% endblock %}
