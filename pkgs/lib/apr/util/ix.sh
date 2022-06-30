{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://archive.apache.org/dist/apr/apr-util-1.6.1.tar.bz2
md5:8ff5dc36fa39a2a3db1df196d3ed6086
{% endblock %}

{% block lib_deps %}
lib/c
lib/apr
lib/gdbm
lib/iconv
lib/expat
lib/sqlite3
lib/openssl
{% endblock %}

{% block configure_flags %}
--with-dbm=gdbm
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-apr-util=${out}/lib/bin/apu-1-config \${COFLAGS}"
{% endblock %}
