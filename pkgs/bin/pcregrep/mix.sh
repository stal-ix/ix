{% extends '//lib/pcre/mix.sh' %}

{% block bld_libs %}
lib/readline
{{super()}}
{% endblock %}
