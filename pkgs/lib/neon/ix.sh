{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://notroj.github.io/neon/neon-0.33.0.tar.gz
sha:659a5cc9cea05e6e7864094f1e13a77abbbdbab452f04d751a8c16a9447cf4b8
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
