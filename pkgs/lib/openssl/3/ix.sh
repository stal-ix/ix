{% extends '//lib/openssl/t/ix.sh' %}

{% block fetch %}
https://github.com/openssl/openssl/archive/refs/tags/openssl-3.3.2.tar.gz
sha:bedbb16955555f99b1a7b1ba90fc97879eb41025081be359ecd6a9fcbdf1c8d2
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
