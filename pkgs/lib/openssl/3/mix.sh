{% extends '//lib/openssl/template.sh' %}

{% block fetch %}
https://www.openssl.org/source/openssl-3.0.0.tar.gz
43c5ab628b7ab899d7cd4a4c7fe4067f
{% endblock %}

{% block make_install_target %}
install_sw
{% endblock %}

{% block postinstall %}
cd ${out} && ln -s lib64 lib
{% endblock %}
