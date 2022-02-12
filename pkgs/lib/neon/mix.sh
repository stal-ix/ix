{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://notroj.github.io/neon/neon-0.32.2.tar.gz
sha:986566468c6295fc5d0fb141a5981e31c9f82ee38e938374abed8471ef2fb286
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
