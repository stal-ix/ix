{% extends '//die/autohell.sh' %}

{% block fetch %}
http://links.twibright.com/download/links-2.27.tar.bz2
sha:d8ddcbfcede7cdde80abeb0a236358f57fa6beb2bcf92e109624e9b896f9ebb4
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/lz4
lib/zstd
lib/bzip2
lib/event
lib/brotli
lib/openssl
{% endblock %}
