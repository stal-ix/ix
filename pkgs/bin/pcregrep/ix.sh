{% extends '//lib/pcre/ix.sh' %}

{% block bld_libs %}
lib/z
lib/bzip2
lib/readline
{{super()}}
{% endblock %}
