{% extends '//lib/openssl/t/mix.sh' %}

{% block fetch %}
https://www.openssl.org/source/openssl-3.0.1.tar.gz
sha:c311ad853353bce796edad01a862c50a8a587f62e7e2100ef465ab53ec9b06d1
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
ln -s lib64 lib
{% endblock %}
