{% extends '//lib/openssl/3/ix.sh' %}

{% block use_data %}
{% endblock %}

{% block openssl_cert_dir %}/nowhere{% endblock %}

{% block install %}
{{super()}}
rm -rf ${out}/lib*
{% endblock %}
