{% extends '//die/c/autohell.sh' %}

{% block version %}
10.2.2
{% endblock %}

{% block fetch %}
https://github.com/NetworkConfiguration/dhcpcd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:69b7bae13ffe08b7e8db4e4a992e4418bcbc9a5cf624221e2341b07e66d98df3
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block configure_flags %}
--dbdir=${out}/var/dhcpcd
--disable-privsep
{% endblock %}
