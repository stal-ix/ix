{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20240901.tar.gz
sha:b5d753befc42e8a852a38e5cb6137c4e5a91585a6cb3888cf0645725c7759a66
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
