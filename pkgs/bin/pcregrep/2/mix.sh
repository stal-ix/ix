{% extends '//lib/pcre/2/mix.sh' %}

{% block bld_libs %}
lib/readline
{{super()}}
{% endblock %}
