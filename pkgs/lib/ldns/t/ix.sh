{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ldns
{% endblock %}

{% block version %}
1.9.2
{% endblock %}

{% block fetch %}
https://github.com/NLnetLabs/ldns/archive/refs/tags/{{self.version().strip()}}.tar.gz
29ed8cf10fb098291cbcbcf1725b480867035b59347ee03ec55d683d47a430f1
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
