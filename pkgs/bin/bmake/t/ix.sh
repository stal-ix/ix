{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20230622.tar.gz
sha:b404c99d60289d78362d0ba0468f541d8a9b4215befee2fbe5750534849cec00
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
