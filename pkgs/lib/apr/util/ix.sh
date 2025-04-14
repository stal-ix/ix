{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
apr-util
{% endblock %}

{% block version %}
1.6.3
{% endblock %}

{% block fetch %}
https://archive.apache.org/dist/apr/apr-util-{{self.version().strip()}}.tar.bz2
sha:a41076e3710746326c3945042994ad9a4fcac0ce0277dd8fea076fec3c9772b5
{% endblock %}

{% block lib_deps %}
lib/c
lib/apr
lib/gdbm
lib/iconv
lib/expat
lib/openssl
lib/sqlite/3
{% endblock %}

{% block configure_flags %}
--with-dbm=gdbm
{% endblock %}

{% block env %}
export COFLAGS="--with-apr-util=${out}/lib/bin/apu-1-config \${COFLAGS}"
{% endblock %}
