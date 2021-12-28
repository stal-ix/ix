{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/mobile-shell/mosh/archive/refs/tags/mosh-1.3.2.tar.gz
04f48ea1b98ba1799593ca9c5b3cc90f
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/protobuf
lib/curses
lib/openssl
{% endblock %}

{% block bld_tool %}
lib/protobuf
dev/build/auto/conf/2/69
dev/build/auto/make/1/16
{% endblock %}

{% block autoreconf %}
dash autogen.sh
{% endblock %}

{% block patch %}
sed -e 's| bind(| ::bind(|' -i src/network/network.cc
{% endblock %}
