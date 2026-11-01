{% extends 't/ix.sh' %}

# noauto

{% block pkg_name %}
openssl
{% endblock %}

{% block version %}
3.6.5
{% endblock %}

{% block fetch %}
https://github.com/openssl/openssl/archive/refs/tags/openssl-{{self.version().strip()}}.tar.gz
f3091b7ccb41a11d877b7406b7afc9dd9c5003d299c6bb33cff882127bc06c91
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-openssl-quic \${COFLAGS}"
{% endblock %}
