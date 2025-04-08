{% extends 't/ix.sh' %}

{% block fetch %}
https://github.com/openssl/openssl/archive/refs/tags/openssl-3.5.0.tar.gz
sha:576740bfe93209efda2be7cecb00dfeabe77fe9c5c908c1790cbe8fa50b223d0
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-openssl-quic \${COFLAGS}"
{% endblock %}
