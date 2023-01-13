{% extends 't/ix.sh' %}

{% block lib_deps %}
lib/c
lib/gdbm
{{super()}}
{% endblock %}

{% block cpp_defines %}
{{super()}}
HAVE_NDBM_H=1
USE_NDBM=1
{% endblock %}
