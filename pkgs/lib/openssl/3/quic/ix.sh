{% extends '//lib/openssl/3/t/ix.sh' %}

{% block pkg_name %}
quictls-openssl
{% endblock %}

{% block version %}
3.1.7
{% endblock %}

{% block fetch %}
https://github.com/quictls/openssl/archive/refs/tags/openssl-{{self.version().strip()}}-quic1.tar.gz
e7e514ea033c290f09c7250dd43a845bc1e08066b793274f3ad3fe04c76a5206
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--without-openssl-quic \${COFLAGS}"
{% endblock %}
