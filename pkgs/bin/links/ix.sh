{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://links.twibright.com/download/links-2.29.tar.bz2
sha:22aa96c0b38e1a6f8f7ed9d7a4167a47fc37246097759ef6059ecf8f9ead7998
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/lz4
lib/zstd
lib/event
lib/bzip/2
lib/brotli
lib/openssl
{% endblock %}
