{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libtorrent
{% endblock %}

{% block version %}
0.16.27
{% endblock %}

{% block fetch %}
https://github.com/rakshasa/libtorrent/archive/refs/tags/v{{self.version().strip()}}.tar.gz
dfef062965b1675e3c21663898eefa31ef18a8bf80c0ab872735c0bf89c4035c
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
