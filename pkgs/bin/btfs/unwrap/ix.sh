{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
btfs
{% endblock %}

{% block version %}
3.1
{% endblock %}

{% block fetch %}
https://github.com/johang/btfs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:c363f04149f97baf1c5e10ac90677b8309724f2042ab045a45041cfb7b44649b
{% endblock %}

{% block bld_libs %}
lib/c
lib/curl
lib/fuse/3
lib/torrent/rasterbar
{% endblock %}
