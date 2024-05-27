{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/NetworkConfiguration/dhcpcd/archive/refs/tags/v10.0.8.tar.gz
sha:f12babff1d3b880a63afc1df1c64c408f3784106e47c932f690bafbed8a83c3e
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block configure_flags %}
--dbdir=${out}/var/dhcpcd
--disable-privsep
{% endblock %}
