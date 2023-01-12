{% extends '//bin/iwd/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--disable-client
--disable-monitor
{% endblock %}
