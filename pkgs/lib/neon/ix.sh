{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
neon
{% endblock %}

{% block version %}
0.34.2
{% endblock %}

{% block fetch %}
https://notroj.github.io/neon/neon-{{self.version().strip()}}.tar.gz
sha:f98ce3c74300be05eddf05dccbdca498b14d40c289f773195dd1a559cffa5856
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
