{% extends '//lib/magic/t/ix.sh' %}

{% block bld_libs %}
lib/intl
{{super()}}
{% endblock %}
