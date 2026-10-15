{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
rsync
{% endblock %}

{% block version %}
3.5.1
{% endblock %}

{% block fetch %}
https://download.samba.org/pub/rsync/src/rsync-{{self.version().strip()}}.tar.gz
c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d63724d25c37bef
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
