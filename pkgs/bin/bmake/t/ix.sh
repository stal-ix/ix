{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20240212.tar.gz
sha:971d5a364035349e984d82c2a48d546a0c73e52f3b8f2aa29a3be3d2408ffaa8
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
