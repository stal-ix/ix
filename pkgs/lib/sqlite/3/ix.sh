{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.sqlite.org/2022/sqlite-autoconf-3390200.tar.gz
sha:852be8a6183a17ba47cee0bbff7400b7aa5affd283bf3beefc34fcd088a239de
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

{% block env_lib %}
export COFLAGS="--with-sqlite3=${out} \${COFLAGS}"
{% endblock %}
