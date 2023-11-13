{% extends 't/ix.sh' %}

{% block configure_flags %}
{{super()}}
--disable-bootstrap
{% endblock %}

{% block configure %}
{{super()}}
cat << EOF >> src/config.h
#undef realloc
EOF
{% endblock %}
