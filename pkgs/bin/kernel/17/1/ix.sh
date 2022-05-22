{% extends '//bin/kernel/17/t/ix.sh' %}

{% block slot %}1{% endblock %}

{% block kconfig_flags %}
{% include 'cfg' %}
{{super()}}
{% endblock %}
