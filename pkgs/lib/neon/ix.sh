{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
neon
{% endblock %}

{% block version %}
0.37.1
{% endblock %}

{% block fetch %}
https://notroj.github.io/neon/neon-{{self.version().strip()}}.tar.gz
a99b7262525a454d1065cf76dd17240fd808dfc4ef15636990ff83a5d0d9e740
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
