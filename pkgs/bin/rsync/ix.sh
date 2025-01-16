{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://download.samba.org/pub/rsync/src/rsync-3.4.1.tar.gz
sha:2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52
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
