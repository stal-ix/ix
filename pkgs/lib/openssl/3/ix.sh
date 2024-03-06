{% extends '//lib/openssl/t/ix.sh' %}

{% block fetch %}
https://github.com/quictls/openssl/archive/refs/tags/openssl-3.1.5-quic1.tar.gz
sha:928a0c484fca5a5b9ae484e7b14e6691e946220d77d86ac4031cbb408655b644
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
