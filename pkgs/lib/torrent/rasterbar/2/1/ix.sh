{% extends '//lib/torrent/rasterbar/t/ix.sh' %}

{% block pkg_name %}
libtorrent-rasterbar
{% endblock %}

{% block version %}
2.1.2
{% endblock %}

{% block fetch %}
https://github.com/arvidn/libtorrent/releases/download/v{{self.version().strip()}}/libtorrent-rasterbar-{{self.version().strip()}}.tar.gz
3362546d9cd71b9e49ee6cac7d3f1f914ce9cdb217c86b63d5b22cbed0334dbc
{% endblock %}
