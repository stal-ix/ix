{% extends '//lib/ng/http/2/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--enable-lib-only
{% endblock %}
