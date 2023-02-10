{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://ftp.postgresql.org/pub/source/v15.2/postgresql-15.2.tar.bz2
sha:99a2171fc3d6b5b5f56b757a7a3cb85d509a38e4273805def23941ed2b8468c7
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
