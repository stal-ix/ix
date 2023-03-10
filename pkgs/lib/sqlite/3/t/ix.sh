{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://sqlite.org/2023/sqlite-autoconf-3410100.tar.gz
sha:4dadfbeab9f8e16c695d4fbbc51c16b2f77fb97ff4c1c3d139919dfc038c9e33
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
