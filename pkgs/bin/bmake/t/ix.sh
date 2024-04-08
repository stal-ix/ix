{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20240404.tar.gz
sha:60dfb60090086f2d008d9c4ec8a224c992a3e62522cc06e43764d5d1e3d7d8bd
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
