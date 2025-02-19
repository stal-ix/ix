{% extends '//die/c/configure.sh' %}

{% block fetch %}
https://github.com/sqlite/sqlite/archive/refs/tags/version-3.49.1.tar.gz
sha:bc0ae92c7f7158c6060378582ecb6ae9001a1c2eb08719e12e08940ee076cdb8
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_all_flags %}
--prefix=${out}
--disable-shared
--build={{host.gnu.three}}
--host={{target.gnu.three}}
--disable-load-extension
{% endblock %}

{% block cpp_defines %}
SQLITE_OMIT_LOAD_EXTENSION=1
SQLITE_ENABLE_COLUMN_METADATA=1
{% endblock %}
