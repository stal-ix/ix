{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.stunnel.org/downloads/stunnel-5.72.tar.gz
sha:3d532941281ae353319735144e4adb9ae489a10b7e309c58a48157f08f42e949
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/openssl
{% endblock %}
