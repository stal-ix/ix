{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/neomutt/neomutt/archive/refs/tags/20231006.tar.gz
sha:94b9d5d8f927f8ceb4661549f5a490dc057af2e7f11de41e68dbc227dbf8a015
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/lz4
lib/zstd
lib/intl
lib/lmdb
lib/idn/2
lib/gnutls
lib/curses
lib/pcre/2
lib/openssl
lib/sqlite/3
{% endblock %}

{% block configure %}
sh ./configure \
    --prefix=${out} \
    --libexecdir=${out}/bin/bin_neomutt \
    --disable-doc \
    --ssl \
    --pcre2 \
    --disable-idn \
    --idn2 \
    --lmdb \
    --sqlite \
    --gnutls \
    --lz4 \
    --zstd \
    --zlib
{% endblock %}

{% block bld_tool %}
bld/perl
bld/python
bld/gettext
bld/pkg/config
{% endblock %}
