{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
rtorrent
{% endblock %}

{% block version %}
0.16.28
{% endblock %}

{% block fetch %}
https://github.com/rakshasa/rtorrent/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7d93cf88a75264b267bb66d576d311f6f3bf9af1da01fa645194ccc7e4a50190
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
