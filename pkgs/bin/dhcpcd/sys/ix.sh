{% extends '//bin/dhcpcd/ix.sh' %}

{% block configure_flags %}
{{super()}}
--rundir=/var/run/dhcpcd
--statedir=/var/run/dhcpcd
--dbdir=/var/run/dhcpcd/db
--localstatedir=/var/run/dhcpcd
{% endblock %}

{% block patch %}
sed -e 's|.*INSTALL.*DBDIR.*||' -i src/Makefile
{{super()}}
{% endblock %}
