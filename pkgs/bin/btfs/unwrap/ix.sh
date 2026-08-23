{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
btfs
{% endblock %}

{% block version %}
3.2
{% endblock %}

{% block fetch %}
https://github.com/johang/btfs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f41094e7433b36708bd79e4e2a9431731cbd203c0615aa28a1ac71058126dba1
{% endblock %}

{% block bld_libs %}
lib/c
lib/curl
lib/fuse/3
lib/torrent/rasterbar
{% endblock %}
