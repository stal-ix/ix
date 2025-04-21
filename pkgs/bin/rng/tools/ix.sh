{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
rng-tools
{% endblock %}

{% block version %}
6.17
{% endblock %}

{% block fetch %}
https://github.com/nhorman/rng-tools/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:4aa50994232da74499b60b3ebf79118e30a1943be375b7d931dcf18df5442fd3
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/curl
lib/xml/2
lib/kernel
lib/jansson
lib/jitter/entropy
lib/argp/standalone
{% endblock %}

{% block configure_flags %}
--without-rtlsdr
--without-pkcs11
{% endblock %}
