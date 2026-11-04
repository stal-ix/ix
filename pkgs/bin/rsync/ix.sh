{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
rsync
{% endblock %}

{% block version %}
3.5.2
{% endblock %}

{% block fetch %}
https://download.samba.org/pub/rsync/src/rsync-{{self.version().strip()}}.tar.gz
a10d591825251e070f74c98df3daad195def4ed81b4a2de16169026aea33f6c8
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/lz4
lib/popt
lib/idn/2
lib/zstd
lib/xxhash
lib/openssl
{% endblock %}
