{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libtorrent
{% endblock %}

{% block version %}
0.16.25
{% endblock %}

{% block fetch %}
https://github.com/rakshasa/libtorrent/archive/refs/tags/v{{self.version().strip()}}.tar.gz
c0390ef3454e9456aadb21f704eac6ef659bccc2b3ceb8215f59f1ef30735a14
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
