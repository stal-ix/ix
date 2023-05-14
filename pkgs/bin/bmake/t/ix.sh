{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20230512.tar.gz
sha:b927b50a45e4b5579c6491ab09ce3dbd8b170fb10fe6f16d484e13d15e338ffa
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
