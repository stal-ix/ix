{% extends '//lib/openssl/t/ix.sh' %}

{% block fetch %}
https://github.com/quictls/openssl/archive/refs/tags/openssl-3.0.8-quic1.tar.gz
sha:5374baa2e828aa9d19b170d3e303e36e359fd0dea5e70aa81330b2f0213c08ff
{% endblock %}

{% block openssl_conf_opts %}
--libdir=${out}/lib
no-makedepend
{% endblock %}

{% block env %}
{{super()}}
export ac_cv_working_openssl_hashlib=yes
export ac_cv_working_openssl_ssl=yes
{% endblock %}
