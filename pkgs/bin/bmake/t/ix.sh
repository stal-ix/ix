{% extends '//die/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20220612.tar.gz
sha:e34bcc6375c75ae5b53551da0b1d6c1205cdee61e4f564e2cfe04081a5a682fa
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
