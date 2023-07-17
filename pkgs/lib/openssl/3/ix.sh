{% extends '//lib/openssl/t/ix.sh' %}

{% block fetch %}
https://github.com/quictls/openssl/archive/refs/tags/openssl-3.0.9-quic1.tar.gz
sha:7b76b0968642a3929fabc96acd28302f631d339a90a91fd434cde425a3ec6838
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
