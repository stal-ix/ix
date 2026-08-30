{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
rsync
{% endblock %}

{% block version %}
3.5.0
{% endblock %}

{% block fetch %}
https://download.samba.org/pub/rsync/src/rsync-{{self.version().strip()}}.tar.gz
c7ffd1ef653e99540f661e47cb00b7f9cad1ee6b972399b16f93d672656e0d33
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
