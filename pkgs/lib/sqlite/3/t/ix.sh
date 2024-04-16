{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.sqlite.org/2024/sqlite-autoconf-3450300.tar.gz
sha:b2809ca53124c19c60f42bf627736eae011afdcc205bb48270a5ee9a38191531
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--enable-dynamic-extensions=no
{% endblock %}

{% block cpp_defines %}
SQLITE_OMIT_LOAD_EXTENSION=1
SQLITE_ENABLE_COLUMN_METADATA=1
{% endblock %}
