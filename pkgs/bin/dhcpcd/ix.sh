{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
dhcpcd
{% endblock %}

{% block version %}
10.2.3
{% endblock %}

{% block fetch %}
https://github.com/NetworkConfiguration/dhcpcd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:32f3b01489e545637dc444d83390d7eed1a9d675cb8c664e374a63bbbbd37512
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block configure_flags %}
--dbdir=${out}/var/dhcpcd
--disable-privsep
{% endblock %}
