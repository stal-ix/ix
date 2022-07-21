{% extends '//die/c/wafbase.sh' %}

{% block fetch %}
https://download.samba.org/pub/samba/stable/samba-4.16.3.tar.gz
sha:7a6565d7c0a98eac7a5a283fa94d9266dd39ea62f262ccdc5a634a580d549c58
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/aio
lib/cap
lib/tirpc
lib/uring
lib/gpgme
lib/gnutls
lib/jansson
lib/readline
lib/ini/parser
lib/bsd/overlay
lib/ucontext/posix
{% endblock %}

{% block waf %}${PWD}/buildtools/bin/waf{% endblock %}

{% block patch %}
sed -e 's|/tmp/|/var/tmp/|g' -i lib/replace/wscript
{% endblock %}

{# need strange perl module #}

{% block bld_tool %}
bld/perl
bld/flex
bld/bison
{% endblock %}

{% block waf_flags %}
--disable-python
--without-ad-dc
{% endblock %}
