{% extends '//bin/dropbear/stock/ix.sh' %}

{% block patch %}
find . -name '*.c' | while read l; do
    sed -e 's|.*skipping hostkey check.*||' -i ${l}
done

find . -name '*.h' | while read l; do
    sed -e 's|/etc/dropbear/dropbear|/var/run/sud/dropbear|' -i ${l}
done

sed -e 's|checkpubkey.*== DROPBEAR_FAILURE|0|' \
    -e 's|%s/.ssh/authorized_keys|/etc/sudo/authorized_keys|' \
    -i svr-authpubkey.c

{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-lastlog
--disable-utmp
--disable-utmpx
--disable-wtmp
--disable-wtmpx
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old/dropbear bin/sud_server
rm -r old share
{% endblock %}
