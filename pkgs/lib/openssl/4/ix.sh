{% extends 't/ix.sh' %}

# noauto

{% block pkg_name %}
openssl
{% endblock %}

{% block version %}
4.1.0
{% endblock %}

{% block fetch %}
https://github.com/openssl/openssl/archive/refs/tags/openssl-{{self.version().strip()}}.tar.gz
2a54158eb6861c07cefc92f1a1d68b12d5ecc0883d53c61a092995b221c7d5fe
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-openssl-quic \${COFLAGS}"
{% endblock %}
