{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://download.samba.org/pub/rsync/src/rsync-3.3.0.tar.gz
sha:7399e9a6708c32d678a72a63219e96f23be0be2336e50fd1348498d07041df90
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/lz4
lib/popt
lib/zstd
lib/xxhash
lib/openssl
{% endblock %}
