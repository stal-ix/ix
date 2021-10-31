{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://archive.apache.org/dist/apr/apr-util-1.6.1.tar.bz2
# md5 8ff5dc36fa39a2a3db1df196d3ed6086
{% endblock %}

{% block deps %}
# lib lib/apr/mix.sh
# lib lib/gdbm/mix.sh
# lib lib/iconv/mix.sh
# lib lib/expat/mix.sh
# lib lib/sqlite3/mix.sh
# lib lib/openssl/mix.sh
# bld dev/build/make/mix.sh
# bld dev/build/pkg-config/mix.sh
# bld env/std/mix.sh
{% endblock %}

{% block coflags %}
--with-dbm=gdbm
--disable-util-dso
{% endblock %}

{% block env %}
export COFLAGS="--with-apr-util=${out} --with-libapr-util=${out} \${COFLAGS}"
{% endblock %}
