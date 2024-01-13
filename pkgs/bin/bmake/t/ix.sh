{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20240108.tar.gz
sha:3772578820616e999916f4c51dbd2415b06f7281f68ccccc5e1d38ed238e3107
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
