{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ldns
{% endblock %}

{% block version %}
1.9.0
{% endblock %}

{% block fetch %}
https://github.com/NLnetLabs/ldns/archive/refs/tags/{{self.version().strip()}}.tar.gz
e882cdb6b30504623a799e724f77273c14d5f265c925a2884de9fbc94aa88d19
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
