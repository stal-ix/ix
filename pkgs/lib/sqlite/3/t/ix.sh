{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://sqlite.org/2023/sqlite-autoconf-3440100.tar.gz
sha:63c3181633844adb5e36187f75b8f31a51cd32487992a26b89bf26b22ecdcf48
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
