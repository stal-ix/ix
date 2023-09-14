{% extends '//die/c/autorehell.sh' %}

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
