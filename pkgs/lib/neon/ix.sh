{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://notroj.github.io/neon/neon-0.32.3.tar.gz
sha:94cb875dc6dbfcdee58f039b763c674b0232886cdfd7a5de91be5cdfa2b7596a
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/expat
lib/openssl
{% endblock %}

{% block configure_flags %}
--with-ssl
--with-expat
{% endblock %}
