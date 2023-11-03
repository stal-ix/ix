{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://sqlite.org/2023/sqlite-autoconf-3440000.tar.gz
sha:b9cd386e7cd22af6e0d2a0f06d0404951e1bef109e42ea06cc0450e10cd15550
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
