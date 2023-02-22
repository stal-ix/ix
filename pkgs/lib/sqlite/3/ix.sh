{% extends 't/ix.sh' %}

{% block env %}
{{super()}}
export COFLAGS="--with-sqlite3=${out} \${COFLAGS}"
{% endblock %}
