{% extends '//die/autohell.sh' %}

{% block fetch %}
http://links.twibright.com/download/links-2.26.tar.bz2
sha:f05b3577f25dbe63e491c424f0ecb31f7bfadce9b2bc2f111dfed049c004c9cb
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
