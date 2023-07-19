{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20230711.tar.gz
sha:0a81542c03f1a0e6c27bf5015d8fbbc52634e1190838ec7da7645847d9332fef
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
