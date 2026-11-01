{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
rtorrent
{% endblock %}

{% block version %}
0.16.26
{% endblock %}

{% block fetch %}
https://github.com/rakshasa/rtorrent/archive/refs/tags/v{{self.version().strip()}}.tar.gz
913139a61de5511e61818f38d44cb75aa0be1162b66cd221cab22eda01fd3037
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
