{% extends 't/ix.sh' %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block bld_tool %}
{% if not native %}
bld/jimsh
{% endif %}
{% endblock %}

{% block configure_flags %}
{% if not native %}
--build={{host.gnu.three}}
--host={{target.gnu.three}}
{% endif %}
{% endblock %}

{% block cpp_defines %}
SQLITE_OMIT_LOAD_EXTENSION=1
SQLITE_ENABLE_COLUMN_METADATA=1
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-sqlite3=${out} \${COFLAGS}"
{% endblock %}
