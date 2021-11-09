{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://archive.apache.org/dist/apr/apr-util-1.6.1.tar.bz2
8ff5dc36fa39a2a3db1df196d3ed6086
{% endblock %}

{% block lib_deps %}
lib/apr/mix.sh
lib/gdbm/mix.sh
lib/iconv/mix.sh
lib/expat/mix.sh
lib/sqlite3/mix.sh
lib/openssl/mix.sh
{% endblock %}

{% block bld_deps %}
env/autohell/mix.sh
{% endblock %}

{% block setup %}
export CC=clang
export CPP=cpp
{% endblock %}

{% block coflags %}
--with-dbm=gdbm
--disable-util-dso
{% endblock %}

{% block env %}
export COFLAGS="--with-apr-util=${out} --with-libapr-util=${out} \${COFLAGS}"
{% endblock %}
