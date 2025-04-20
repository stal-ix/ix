{% extends 't/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/jimsh
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block configure_flags %}
--build={{host.gnu.three}}
--host={{target.gnu.three}}
{% endblock %}

{% block cpp_defines %}
SQLITE_OMIT_LOAD_EXTENSION=1
SQLITE_ENABLE_COLUMN_METADATA=1
{% endblock %}
