{% extends 't/ix.sh' %}

{% block pkg_name %}
openssl
{% endblock %}

{% block version %}
3.5.1
{% endblock %}

{% block fetch %}
https://github.com/openssl/openssl/archive/refs/tags/openssl-{{self.version().strip()}}.tar.gz
24e3a8a1e832e29255b55d06fcc473b9f56e60555b504bf4422ca64a0d0c1426
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-openssl-quic \${COFLAGS}"
{% endblock %}
