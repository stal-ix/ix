{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.stunnel.org/downloads/stunnel-5.68.tar.gz
sha:dcd895ab088b043d4e0bafa8b934e7ab3e697293828dbe9fce46cb7609a7dacf
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/openssl
{% endblock %}
