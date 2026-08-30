{% extends '//die/c/make.sh' %}

{% block pkg_name %}
neomutt
{% endblock %}

{% block version %}
20260616
{% endblock %}

{% block fetch %}
https://github.com/neomutt/neomutt/archive/refs/tags/{{self.version().strip()}}.tar.gz
2c34fdd2166d5765e6bfdc21d1248bc4e92ddc0a33537b9418c17cd90e2dda80
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
