{% extends 't/ix.sh' %}

{% block env %}
{{super()}}
export COFLAGS="--with-z=${out} \${COFLAGS}"
{% endblock %}
