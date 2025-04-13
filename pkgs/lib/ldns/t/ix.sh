{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ldns
{% endblock %}

{% block version %}
1.8.4
{% endblock %}

{% block fetch %}
https://github.com/NLnetLabs/ldns/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:b64a0f619ecb74aaf5fe4fbbb4640b150aec55f9a708031a68b3b4fae95326a2
{% endblock %}

{% block lib_deps %}
lib/c
lib/openssl
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block configure_flags %}
--with-drill
{% endblock %}
