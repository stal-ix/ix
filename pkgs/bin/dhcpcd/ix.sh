{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
dhcpcd
{% endblock %}

{% block version %}
10.3.0
{% endblock %}

{% block fetch %}
https://github.com/NetworkConfiguration/dhcpcd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1ed36ac4016a6b8a971ef9fb2b7167bc1af6d3b24ddfceee14ad0066e30dfae1
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block configure_flags %}
--dbdir=${out}/var/dhcpcd
--disable-privsep
{% endblock %}
