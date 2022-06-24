{% extends '//lib/pcre/ix.sh' %}

{% block bld_libs %}
lib/z
lib/bzip/2
lib/readline
{{super()}}
{% endblock %}
