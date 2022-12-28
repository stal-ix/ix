{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/nhorman/rng-tools/archive/refs/tags/v6.15.tar.gz
sha:bff0c58dff90ec10bd61f672e48618e045155eabd60b32d63a9c4ffbdad05f3a
{% endblock %}

{% block bld_libs %}
lib/c
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
