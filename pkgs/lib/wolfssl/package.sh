{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://github.com/wolfSSL/wolfssl/archive/refs/tags/v4.8.1-stable.tar.gz
# md5 f3b2b4fdfe2ad53fd38bcd2ba6c821d2
{% endblock %}

{% block deps %}
# bld dev/build/automake/1.16.3 dev/build/make env/std
{% endblock %}

{% block preconf %}
dash ./autogen.sh
{% endblock %}

{% block coflags %}
--enable-all
--enable-opensslextra
--enable-opensslall
{% endblock %}
