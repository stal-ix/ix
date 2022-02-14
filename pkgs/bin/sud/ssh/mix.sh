{% extends '//bin/dropbear/mix.sh' %}

{% block patch %}
find . -name '*.c' | while read l; do
    sed -e 's|.*skipping hostkey check.*||' -i ${l}
done

{{super()}}
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/bin

rm dropbearconvert dropbearkey

mv dbclient db_client
mv dropbear db_server
{% endblock %}
