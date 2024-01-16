{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.sqlite.org/2024/sqlite-autoconf-3450000.tar.gz
sha:72887d57a1d8f89f52be38ef84a6353ce8c3ed55ada7864eb944abd9a495e436
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
