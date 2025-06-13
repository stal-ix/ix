{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
dhcpcd
{% endblock %}

{% block version %}
10.2.4
{% endblock %}

{% block fetch %}
https://github.com/NetworkConfiguration/dhcpcd/archive/refs/tags/v{{self.version().strip()}}.tar.gz
85c8b2535ddf52091b30b31f29b0f9cafd9cd94dc6b78f1bd92db2afce4c1943
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block configure_flags %}
--dbdir=${out}/var/dhcpcd
--disable-privsep
{% endblock %}
