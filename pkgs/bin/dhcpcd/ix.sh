{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
dhcpcd
{% endblock %}

{% block version %}
10.5.2
{% endblock %}

{% block fetch %}
https://github.com/NetworkConfiguration/dhcpcd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
6040a01c69a17dc166d350f6dacf8444ab1e1945481bc84ff50d7ca74364b78d
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block configure_flags %}
--dbdir=${out}/var/dhcpcd
--disable-privsep
{% endblock %}
