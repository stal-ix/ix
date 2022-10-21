{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://download.samba.org/pub/rsync/src/rsync-3.2.7.tar.gz
sha:4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb
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
