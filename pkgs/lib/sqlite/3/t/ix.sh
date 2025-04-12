{% extends '//die/c/autorehell.sh' %}

{% block version %}
3470200
{% endblock %}

{% block fetch %}
https://www.sqlite.org/2024/sqlite-autoconf-{{self.version().strip()}}.tar.gz
sha:f1b2ee412c28d7472bc95ba996368d6f0cdcf00362affdadb27ed286c179540b
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
