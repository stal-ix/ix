{% extends 't/ix.sh' %}

{% block env %}
{{super()}}
export COFLAGS="--with-libidn=${out} \${COFLAGS}"
{% endblock %}
