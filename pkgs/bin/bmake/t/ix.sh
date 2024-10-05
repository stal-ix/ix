{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20240921.tar.gz
sha:b346579e82d296d1a4da29dea8594e3ee596130b20786dec0f3899a3e11275c2
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
