{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/NetworkConfiguration/dhcpcd/archive/refs/tags/v9.5.1.tar.gz
sha:03317e865b4f37438ef91309947628ecf95ea80354ebc06f7e776ac62d42fd2e
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block configure_flags %}
--dbdir=${out}/var/dhcpcd
--disable-privsep
{% endblock %}
