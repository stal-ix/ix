{% extends '//mix/autohell.sh' %}

{% block fetch %}
http://links.twibright.com/download/links-2.25.tar.bz2
sha:2dd78508698e8279ef4f09a3a2a21e9595040113402da6c553974414fb49dd2c
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/lz4
lib/zstd
lib/bzip2
lib/event
lib/brotli
lib/openssl
{% endblock %}
