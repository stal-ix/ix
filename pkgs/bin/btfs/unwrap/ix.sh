{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/johang/btfs/archive/refs/tags/v2.24.tar.gz
sha:d71ddefe3c572e05362542a0d9fd0240d8d4e1578ace55a8b3245176e7fd8935
{% endblock %}

{% block bld_libs %}
lib/c
lib/curl
lib/fuse/2
lib/torrent/rasterbar
{% endblock %}
