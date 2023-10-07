{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/NetworkConfiguration/dhcpcd/archive/refs/tags/v10.0.3.tar.gz
sha:6847d290ec20cfcaeafd32caff29b21d7f0481dae41446655926adc99d09740d
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block configure_flags %}
--dbdir=${out}/var/dhcpcd
--disable-privsep
{% endblock %}
