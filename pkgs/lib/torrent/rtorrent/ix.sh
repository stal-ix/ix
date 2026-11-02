{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libtorrent
{% endblock %}

{% block version %}
0.16.26
{% endblock %}

{% block fetch %}
https://github.com/rakshasa/libtorrent/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f3674a26c8398c38583f62e235a69056cf4142745af11cf9f7c2a6006c23a30a
{% endblock %}

{% block patch %}
sed -e 's|std::distance(log_groups.begin(), this)|std::distance(log_groups.data(), this)|g' -i src/torrent/utils/log.cc
sed -e 's|std::string_view(first, last - first)|std::string_view(\&*first, last - first)|' -i src/torrent/utils/string_manip.cc
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/curl
lib/openssl
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}
