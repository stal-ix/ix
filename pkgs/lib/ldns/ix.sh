{% extends 't/ix.sh' %}

{% block configure_flags %}
{{super()}}
--without-drill
{% endblock %}

{% block env %}
export COFLAGS="--with-ldns=${out} \${COFLAGS}"
{% endblock %}
