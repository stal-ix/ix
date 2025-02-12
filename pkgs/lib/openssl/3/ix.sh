{% extends 't/ix.sh' %}

{% block fetch %}
https://github.com/openssl/openssl/archive/refs/tags/openssl-3.4.1.tar.gz
sha:d4b22527a645acf76b53e44487a8db687c6eed621d7246891d025e38ba8c9651
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-openssl-quic \${COFLAGS}"
{% endblock %}
