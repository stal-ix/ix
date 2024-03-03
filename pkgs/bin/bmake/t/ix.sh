{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20240301.tar.gz
sha:24ce0be3acfc8b93c75a0796c62eecc16376e3a7c05570b302d20480e38e9f59
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
