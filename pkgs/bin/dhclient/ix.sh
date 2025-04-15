{% extends '//die/c/autorehell.sh' %}

{% block version %}
4.4.3-P1
{% endblock %}

{% block pkg_name %}
dhcp
{% endblock %}

{% block fetch %}
https://ftp.isc.org/isc/dhcp/{{self.version().strip()}}/dhcp-{{self.version().strip()}}.tar.gz
sha:0ac416bb55997ca8632174fd10737fd61cdb8dba2752160a335775bc21dc73c7
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block bld_tool %}
bin/tar
bin/gzip
bld/gettext
{% endblock %}

{% block patch %}
sed -e 's|tar xf -|tar -x -f - --no-same-permissions --no-same-owner|' -i bind/Makefile.in
sed '/o.*dhcp_type/d' -i server/mdb.c
sed -r '/u.*(local|remote)_port/d' -i client/dhclient.c relay/dhcrelay.c
{% endblock %}

{% block install %}
cd client
{{super()}}
{% endblock %}

{% block build %}
cd bind
make
cd ..
{{super()}}
{% endblock %}
