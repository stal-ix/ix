{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20240430.tar.gz
sha:aa88fc44ff5795c5c14540d25f37f23943f006ab35f922a4523224bc75e1a787
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
