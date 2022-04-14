{% extends '//lib/openssl/t/mix.sh' %}

{% block fetch %}
https://github.com/quictls/openssl/archive/refs/heads/openssl-3.0.2+quic.zip
sha:a6228498484993730d6839991fdfa4a2db8515c674cb4d6462c9022f23b053fc
{% endblock %}

{% block openssl_conf_opts %}
--libdir=${out}/lib
{% endblock %}
