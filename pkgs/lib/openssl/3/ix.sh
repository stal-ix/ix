{% extends 't/ix.sh' %}

{% block fetch %}
https://github.com/openssl/openssl/archive/refs/tags/openssl-3.4.0.tar.gz
sha:1ca043a26fbea74cdf7faf623a6f14032a01117d141c4a5208ccac819ccc896b
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-openssl-quic \${COFLAGS}"
{% endblock %}
