{% extends '//bin/iwd/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--with-dbus-datadir=/etc
--localstatedir=/var/run/iwd
--disable-client
--disable-monitor
--disable-dbus-policy
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|install-data-local|install-data-local-xxx|' -i Makefile.am
echo 'install-data-local:' >> Makefile.am
{% endblock %}
