{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
apr-util
{% endblock %}

{% block version %}
1.6.6
{% endblock %}

{% block fetch %}
https://archive.apache.org/dist/apr/apr-util-{{self.version().strip()}}.tar.bz2
aa77dd25f036731b7246abbfbebe6cc813b42799b62c874bc82bd4e1f90f2918
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
