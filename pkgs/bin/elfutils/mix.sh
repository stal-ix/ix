{% extends '//lib/elfutils/mix.sh' %}

{% block bld_libs %}
lib/intl
{{super()}}
{% endblock %}
