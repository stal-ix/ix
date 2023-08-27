{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/aria2/aria2/archive/refs/tags/release-1.36.0.tar.gz
sha:782b5dad48cb333e0cbef8795f868f7963455efecfd2a818feb8dab1cfa973f5
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/uv
lib/c++
lib/gmp
lib/expat
lib/ssh/2
lib/c/ares
lib/gnutls
lib/gcrypt
lib/nettle
lib/sqlite/3
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block setup %}
export CXXFLAGS="-std=c++14 ${CXXFLAGS}"
{% endblock %}

{% block configure_flags %}
--with-libuv
--with-gnutls
--with-libnettle
--with-libgmp
--with-libgcrypt
--with-sqlite3
--with-libexpat
--with-libcares
--with-libz
{% endblock %}
