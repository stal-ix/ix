{% extends '//lib/xz/t/ix.sh' %}

{% block bld_libs %}
lib/intl
{{super()}}
{% endblock %}
