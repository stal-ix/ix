{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.stunnel.org/downloads/stunnel-5.73.tar.gz
sha:bc917c3bcd943a4d632360c067977a31e85e385f5f4845f69749bce88183cb38
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/openssl
{% endblock %}
