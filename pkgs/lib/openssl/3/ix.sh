{% extends '//lib/openssl/t/ix.sh' %}

{% block fetch %}
https://github.com/quictls/openssl/archive/refs/heads/openssl-3.0.3+quic.zip
sha:102dcfbeaa5bfdbe2defe62574e8d9fa1feb608f1fa930d2d544950dea3ba9bf
{% endblock %}

{% block openssl_conf_opts %}
--libdir=${out}/lib
{% endblock %}
