{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
apr-util
{% endblock %}

{% block version %}
1.6.5
{% endblock %}

{% block fetch %}
https://archive.apache.org/dist/apr/apr-util-{{self.version().strip()}}.tar.bz2
96de1dd6f6a0476d2d2e7964926d8c1ddc3bb0e210e1b1812d3ba5a454a392e2
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
