{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/mobile-shell/mosh/archive/refs/tags/mosh-1.3.2.tar.gz
04f48ea1b98ba1799593ca9c5b3cc90f
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/curses
lib/openssl
lib/protobuf
{% endblock %}

{% block bld_tool %}
bin/protoc
{% endblock %}

{% block patch %}
sed -e 's| bind(| ::bind(|' -i src/network/network.cc
{% endblock %}
