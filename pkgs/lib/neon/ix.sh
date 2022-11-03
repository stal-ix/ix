{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://notroj.github.io/neon/neon-0.32.4.tar.gz
sha:b1e2120e4ae07df952c4a858731619733115c5f438965de4fab41d6bf7e7a508
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
