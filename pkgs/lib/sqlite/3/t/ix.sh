{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.sqlite.org/2024/sqlite-autoconf-3460000.tar.gz
sha:6f8e6a7b335273748816f9b3b62bbdc372a889de8782d7f048c653a447417a7d
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
