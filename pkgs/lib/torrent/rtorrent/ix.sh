{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libtorrent
{% endblock %}

{% block version %}
0.15.2
{% endblock %}

{% block fetch %}
https://github.com/rakshasa/libtorrent/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:045cfc796579dd08445745c3cd38427004202eaa7529d349e482c2b67f3b52b0
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/openssl
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}
