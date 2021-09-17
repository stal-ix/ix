{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://archive.apache.org/dist/apr/apr-util-1.6.1.tar.bz2
# md5 8ff5dc36fa39a2a3db1df196d3ed6086
{% endblock %}

{% block deps %}
# lib lib/apr lib/gdbm lib/iconv lib/expat lib/sqlite3 lib/openssl
# bld dev/build/make dev/build/pkg-config env/std
{% endblock %}

{% block coflags %}
--with-dbm=gdbm
--disable-util-dso
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include \${CPPFLAGS}"
export LDFLAGS="-L${out}/lib -laprutil-1 \${LDFLAGS}"
export COFLAGS="--with-apr-util=${out} --with-libapr-util=${out} \${COFLAGS}"
export PKG_CONFIG_PATH="${out}/lib/pkgconfig:\${PKG_CONFIG_PATH}"
{% endblock %}
