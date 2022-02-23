{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://www.sqlite.org/2022/sqlite-autoconf-3380000.tar.gz
sha:1c76e25dc63d9f3935e0f406aec520a33ee77cf54ea5147dffe1fae8369eff68
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--enable-dynamic-extensions=no
{% endblock %}

{% block cpp_defines %}
SQLITE_OMIT_LOAD_EXTENSION=1
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-sqlite3=${out} \${COFLAGS}"
{% endblock %}
