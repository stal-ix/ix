{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.sqlite.org/2024/sqlite-autoconf-3470100.tar.gz
sha:416a6f45bf2cacd494b208fdee1beda509abda951d5f47bc4f2792126f01b452
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
