{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.crufty.net/ftp/pub/sjg/bmake-20240711.tar.gz
sha:cfedac09db9086acad55e7a3a0d224068f74b4c011c5b64ad71f1d8680878ce0
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
