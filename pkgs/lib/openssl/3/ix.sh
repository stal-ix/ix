{% extends 't/ix.sh' %}

{% block fetch %}
https://github.com/openssl/openssl/archive/refs/tags/openssl-3.3.2.tar.gz
sha:bedbb16955555f99b1a7b1ba90fc97879eb41025081be359ecd6a9fcbdf1c8d2
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-openssl-quic \${COFLAGS}"
{% endblock %}
