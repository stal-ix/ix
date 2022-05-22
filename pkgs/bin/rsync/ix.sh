{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://download.samba.org/pub/rsync/src-previews/rsync-3.2.4pre3.tar.gz
sha:40083afd5514501215a8cd166f5f6adf92af76ff82f4cce01f60a192d7648952
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
