{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://ftp.isc.org/isc/dhcp/4.4.2-P1/dhcp-4.4.2-P1.tar.gz
sha:b05e04337539545a8faa0d6ac518defc61a07e5aec66a857f455e7f218c85a1a
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
{% endblock %}

{% block bld_tool %}
bin/gettext
{% endblock %}

{% block patch %}
sed '/o.*dhcp_type/d' -i server/mdb.c

sed -r '/u.*(local|remote)_port/d' \
    -i client/dhclient.c relay/dhcrelay.c
{% endblock %}

{% block install %}
cd client
{{super()}}
{% endblock %}
