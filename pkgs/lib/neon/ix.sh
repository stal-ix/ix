{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
neon
{% endblock %}

{% block version %}
0.34.1
{% endblock %}

{% block fetch %}
https://notroj.github.io/neon/neon-{{self.version().strip()}}.tar.gz
sha:29a9a8ee1468e7224eb4e4deb4445ef9c56940b41d50941570aac78a6021d461
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
