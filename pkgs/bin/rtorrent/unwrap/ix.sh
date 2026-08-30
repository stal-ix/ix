{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
rtorrent
{% endblock %}

{% block version %}
0.16.20
{% endblock %}

{% block fetch %}
https://github.com/rakshasa/rtorrent/archive/refs/tags/v{{self.version().strip()}}.tar.gz
a089a6f4d39091315da1c76e381ababf486ea9b0a9d60546368fd84cd1cf4da3
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/curl
lib/curses
lib/torrent/rtorrent
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block autoreconf %}
{{super()}}
sed -e 's|.*PKG_CHECK_EXISTS.*||' -i configure
{% endblock %}
