{% extends '//lib/key/utils/t/ix.sh' %}

{% block make_flags %}
{{super()}}
NO_SOLIB=1
{% endblock %}
