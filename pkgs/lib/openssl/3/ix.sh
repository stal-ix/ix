{% extends '//lib/openssl/t/ix.sh' %}

{% block fetch %}
https://github.com/quictls/openssl/archive/refs/tags/openssl-3.0.7+quic1.zip
sha:b4e9072c8f470e5ec33b2a77da30434dcdf38f945ffb4913865acbf0915dcb4c
{% endblock %}

{% block openssl_conf_opts %}
--libdir=${out}/lib
{% endblock %}
