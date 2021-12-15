{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://archive.apache.org/dist/apr/apr-util-1.6.1.tar.bz2
8ff5dc36fa39a2a3db1df196d3ed6086
{% endblock %}

{% block lib_deps %}
lib/c/mix.sh
lib/apr/mix.sh
lib/gdbm/mix.sh
lib/iconv/mix.sh
lib/expat/mix.sh
lib/sqlite3/mix.sh
lib/openssl/mix.sh
{% endblock %}

{% block configure_flags %}
--with-dbm=gdbm
{% endblock %}

{% block env %}
export COFLAGS="--with-apr-util=${out}/lib/bin/apu-1-config \${COFLAGS}"
{% endblock %}
