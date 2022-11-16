{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.postgresql.org/pub/source/v14.4/postgresql-14.4.tar.bz2
sha:c23b6237c5231c791511bdc79098617d6852e9e3bdf360efd8b5d15a1a3d8f6a
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/icu
lib/xml/2
lib/xslt
lib/intl
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
