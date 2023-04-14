{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/NetworkConfiguration/dhcpcd/archive/refs/tags/dhcpcd-9.5.0.tar.gz
sha:bb8ebda4b250ca8c2faa910205f5ffac66ae83a786b59f5cedbfe7624ad04bc2
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block configure_flags %}
--dbdir=${out}/var/dhcpcd
--disable-privsep
{% endblock %}
