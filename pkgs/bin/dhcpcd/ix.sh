{% extends '//die/autohell.sh' %}

{% block fetch %}
https://roy.marples.name/downloads/dhcpcd/dhcpcd-9.4.1.tar.xz
sha:819357634efed1ea5cf44ec01b24d3d3f8852fec8b4249925dcc5667c54e376c
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
{% endblock %}

{% block configure_flags %}
--dbdir=${out}/var/dhcpcd
--disable-privsep
{% endblock %}
