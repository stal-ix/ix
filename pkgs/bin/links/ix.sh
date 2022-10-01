{% extends '//die/c/autohell.sh' %}

{% block fetch %}
http://links.twibright.com/download/links-2.28.tar.bz2
sha:2fd5499b13dee59457c132c167b8495c40deda75389489c6cccb683193f454b4
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
