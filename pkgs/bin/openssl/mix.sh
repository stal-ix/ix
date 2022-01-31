{% extends '//lib/openssl/3/mix.sh' %}

{% block run_data %}
{% endblock %}

{% block openssl_cert_dir %}/nowhere{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): check it'
{% endblock %}
