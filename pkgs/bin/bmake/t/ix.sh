{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20240808.tar.gz
sha:b59189251b483decd4492f1f74387b2a584c03d5aa4637cd48b38ec62b9c0848
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
