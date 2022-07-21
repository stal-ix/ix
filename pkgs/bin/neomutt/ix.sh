{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/neomutt/neomutt/archive/refs/tags/20220429.tar.gz
sha:45496542897ba8de6bc7cce3f5951d9033ed1c49e5d6f1353adaeefe795d9043
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
lib/openssl
lib/sqlite/3
lib/pcre/2/posix
{% endblock %}

{% block configure %}
sh ./configure \
    --prefix=${out} \
    --disable-doc \
    --ssl \
    --pcre2 \
    --disable-idn --idn2 \
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
{% endblock %}
