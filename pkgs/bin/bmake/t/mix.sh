{% extends '//mix/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20220418.tar.gz
sha:6ea7de515cba74f173dc14ee17b1488ae032582028d2e86ea12f70369cc896f5
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
