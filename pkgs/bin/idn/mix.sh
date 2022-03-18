{% extends '//lib/idn/mix.sh' %}

{% block bld_libs %}
lib/intl
{{super()}}
{% endblock %}
