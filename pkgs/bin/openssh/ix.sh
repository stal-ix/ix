{% extends 't/ix.sh' %}

{% block configure_flags %}
{{super()}}
--with-privsep-path=${out}/tmp/privsep
{% endblock %}
