{% extends '//bin/kernel/6/6/slot/1/ix.sh' %}

{% block slot %}0{% endblock %}

{% block kernel_flags %}
{% include 'cfg' %}
{% endblock %}

{% block firmware %}
{% endblock %}

{% block bld_tool %}
bin/tar
{{super()}}
{% endblock %}
