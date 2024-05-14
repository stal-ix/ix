{% extends 't/ix.sh' %}

{% block env %}
{{super()}}
export COFLAGS="--with-msh3=${out} \${COFLAGS}"
{% endblock %}
