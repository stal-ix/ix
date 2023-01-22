{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://notroj.github.io/neon/neon-0.32.5.tar.gz
sha:4872e12f802572dedd4b02f870065814b2d5141f7dbdaf708eedab826b51a58a
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
