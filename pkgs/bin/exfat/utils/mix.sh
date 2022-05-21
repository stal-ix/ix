{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/relan/exfat/releases/download/v1.3.0/exfat-utils-1.3.0.tar.gz
sha:dfebd07a7b907e2d603d3a9626e6440bd43ec6c4e8c07ccfc57ce9502b724835
{% endblock %}

{% block bld_libs %}
lib/c
lib/fuse/2
{% endblock %}
