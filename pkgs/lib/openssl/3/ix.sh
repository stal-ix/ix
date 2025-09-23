{% extends 't/ix.sh' %}

{% block pkg_name %}
openssl
{% endblock %}

{% block version %}
3.5.3
{% endblock %}

{% block fetch %}
https://github.com/openssl/openssl/archive/refs/tags/openssl-{{self.version().strip()}}.tar.gz
073f7c905a676586c334e6ae420c7ac4f4082ccb2104e8a369308d10b35ba973
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-openssl-quic \${COFLAGS}"
{% endblock %}
