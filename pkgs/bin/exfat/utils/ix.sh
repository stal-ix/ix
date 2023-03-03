{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/relan/exfat/releases/download/v1.4.0/exfat-utils-1.4.0.tar.gz
sha:241575fa93104406a47e79e53e4d907bae69886f11621f70a45276c62b75bf69
{% endblock %}

{% block bld_libs %}
lib/c
lib/fuse/2
{% endblock %}
