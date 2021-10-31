{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://archive.apache.org/dist/apr/apr-util-1.6.1.tar.bz2
# md5 8ff5dc36fa39a2a3db1df196d3ed6086
{% endblock %}

{% block deps %}
# lib lib/apr/package.sh
# lib lib/gdbm/package.sh
# lib lib/iconv/package.sh
# lib lib/expat/package.sh
# lib lib/sqlite3/package.sh
# lib lib/openssl/package.sh
# bld dev/build/make/package.sh
# bld dev/build/pkg-config/package.sh
# bld env/std/package.sh
{% endblock %}

{% block coflags %}
--with-dbm=gdbm
--disable-util-dso
{% endblock %}

{% block env %}
export COFLAGS="--with-apr-util=${out} --with-libapr-util=${out} \${COFLAGS}"
{% endblock %}
