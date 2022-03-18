{% extends '//lib/idn/2/mix.sh' %}

{% block bld_libs %}
lib/intl
{{super()}}
{% endblock %}
