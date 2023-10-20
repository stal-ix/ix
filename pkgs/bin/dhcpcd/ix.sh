{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/NetworkConfiguration/dhcpcd/archive/refs/tags/v10.0.4.tar.gz
sha:321115d7e57cdf1fa975c4ba7e8a99fc1ef4eaac3f046ec4bc41ddd3971c4489
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block configure_flags %}
--dbdir=${out}/var/dhcpcd
--disable-privsep
{% endblock %}
