{% extends '//bin/kernel/18/t/mix.sh' %}

{% block slot %}0{% endblock %}

{% block kconfig_flags %}
{% include 'cfg' %}
{{super()}}
{% endblock %}
