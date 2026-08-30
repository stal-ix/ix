{% extends 't/ix.sh' %}

{% block pkg_name %}
openssl
{% endblock %}

{% block version %}
4.0.2
{% endblock %}

{% block fetch %}
https://github.com/openssl/openssl/archive/refs/tags/openssl-{{self.version().strip()}}.tar.gz
0c79e20fe326f50eb2ef58ee45306db2258d55bd16f6dbf6061658a1cad48c35
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-openssl-quic \${COFLAGS}"
{% endblock %}
