{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/aria2/aria2/archive/refs/tags/release-1.37.0.tar.gz
sha:9104878396cc30441976afdd3af9331ec51306fabf92fb82724c3b8fa7d72932
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
