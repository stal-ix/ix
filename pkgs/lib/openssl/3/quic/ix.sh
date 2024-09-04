{% extends '//lib/openssl/3/t/ix.sh' %}

{% block fetch %}
https://github.com/quictls/openssl/archive/refs/tags/openssl-3.1.7-quic1.tar.gz
sha:e7e514ea033c290f09c7250dd43a845bc1e08066b793274f3ad3fe04c76a5206
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--without-openssl-quic \${COFLAGS}"
{% endblock %}
