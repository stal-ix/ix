{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/rakshasa/rtorrent/archive/refs/tags/v0.15.0.tar.gz
sha:9a47f284616c4b3867c787b78f98de25730e7506909824a951399b612d17314a
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
