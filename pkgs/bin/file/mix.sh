{% extends '//lib/magic/t/mix.sh' %}

{% block bld_libs %}
lib/intl
{{super()}}
{% endblock %}
