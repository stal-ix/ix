{% extends '//lib/sqlite3/mix.sh' %}

{% block bld_libs %}
lib/z
lib/readline
{{super()}}
{% endblock %}

{% block configure_flags %}
--enable-readline
{{super()}}
{% endblock %}
