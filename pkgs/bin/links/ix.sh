{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
links
{% endblock %}

{% block version %}
2.30
{% endblock %}

{% block fetch %}
http://links.twibright.com/download/links-{{self.version().strip()}}.tar.bz2
c4631c6b5a11527cdc3cb7872fc23b7f2b25c2b021d596be410dadb40315f166
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
