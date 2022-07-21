{% extends '//bin/kernel/18/t/ix.sh' %}

{% block slot %}1{% endblock %}

{% block kconfig_flags %}
{% block kernel_flags %}
{% include 'cfg' %}
{% endblock %}
{{super()}}
{% endblock %}
