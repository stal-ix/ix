{% extends '//bin/make/ix.sh' %}

{% block cpp_defines %}
{{super()}}
USE_POSIX_SPAWN=1
{% endblock %}

{% block patch %}
{{super()}}
cat << EOF >> src/makeint.h
#if defined(SET_STACK_SIZE)
#error shit shit shit
#endif
EOF
{% endblock %}
