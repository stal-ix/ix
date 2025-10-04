{% extends 't/ix.sh' %}

{% block pkg_name %}
openssl
{% endblock %}

{% block version %}
3.6.0
{% endblock %}

{% block fetch %}
https://github.com/openssl/openssl/archive/refs/tags/openssl-{{self.version().strip()}}.tar.gz
1535d184cbd04ea6b20485b98719fa8d609e45c3657f7c65b8299ae606f78159
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-openssl-quic \${COFLAGS}"
{% endblock %}
