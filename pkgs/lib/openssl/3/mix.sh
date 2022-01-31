{% extends '//lib/openssl/t/mix.sh' %}

{% block fetch %}
https://www.openssl.org/source/openssl-3.0.0.tar.gz
43c5ab628b7ab899d7cd4a4c7fe4067f
{% endblock %}

{% block install %}
{{super()}}

cd ${out} && ln -s lib64 lib
{% endblock %}
