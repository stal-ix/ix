{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
btfs
{% endblock %}

{% block version %}
3.3
{% endblock %}

{% block fetch %}
https://github.com/johang/btfs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
9658625244a88e836bfbed53928c104907fc46bdfffb91225284ea8b6947f5a6
{% endblock %}

{% block bld_libs %}
lib/c
lib/curl
lib/fuse/3
lib/torrent/rasterbar/2/1
{% endblock %}
