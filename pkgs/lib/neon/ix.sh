{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
neon
{% endblock %}

{% block version %}
0.36.0
{% endblock %}

{% block fetch %}
https://notroj.github.io/neon/neon-{{self.version().strip()}}.tar.gz
70cc7f2aeebde263906e185b266e04e0de92b38e5f4ecccbf61e8b79177c2f07
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
