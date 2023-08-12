{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.postgresql.org/pub/source/v15.4/postgresql-15.4.tar.bz2
sha:baec5a4bdc4437336653b6cb5d9ed89be5bd5c0c58b94e0becee0a999e63c8f9
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/icu
lib/xslt
lib/intl
lib/xml/2
lib/kernel
lib/openssl
lib/readline
lib/linux/util
{% endblock %}

{% block configure_flags %}
--with-openssl
--with-readline
--with-uuid=e2fs
--enable-thread-safety
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
