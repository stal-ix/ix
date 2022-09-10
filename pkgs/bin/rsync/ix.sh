{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://download.samba.org/pub/rsync/src/rsync-3.2.6.tar.gz
sha:fb3365bab27837d41feaf42e967c57bd3a47bc8f10765a3671efd6a3835454d3
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
