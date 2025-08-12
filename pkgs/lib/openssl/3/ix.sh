{% extends 't/ix.sh' %}

{% block pkg_name %}
openssl
{% endblock %}

{% block version %}
3.5.2
{% endblock %}

{% block fetch %}
https://github.com/openssl/openssl/archive/refs/tags/openssl-{{self.version().strip()}}.tar.gz
ab2c26cc1ffead456bafdb920c90216a727a060d727b305e44f1e4f6dbf4c6cb
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-openssl-quic \${COFLAGS}"
{% endblock %}
