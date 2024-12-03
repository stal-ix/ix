{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/rakshasa/rtorrent/archive/refs/tags/v0.10.0.tar.gz
sha:f1112e8ad9f4be09dc1ee2539fd73758de7fcd86a391814e73fb671c929f79b2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/curl
lib/curses
lib/torrent/rtorrent
{% endblock %}

{% block autoreconf %}
{{super()}}
sed -e 's|.*PKG_CHECK_EXISTS.*||' -i configure
{% endblock %}
