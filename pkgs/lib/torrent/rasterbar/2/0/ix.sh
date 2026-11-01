{% extends '//lib/torrent/rasterbar/t/ix.sh' %}

{% block pkg_name %}
libtorrent-rasterbar
{% endblock %}

{% block version %}
2.0.15
{% endblock %}

{% block fetch %}
https://github.com/arvidn/libtorrent/releases/download/v{{self.version().strip()}}/libtorrent-rasterbar-{{self.version().strip()}}.tar.gz
5e2e79129823b7ea48721164c32b5aaf83d3fd733b5502100f6705b29f27bb02
{% endblock %}
