{% extends '//lib/sqlite/3/t/ix.sh' %}

{% block bld_libs %}
lib/z
lib/readline
{{super()}}
{% endblock %}

{% block configure_all_flags %}
{{super()}}
--readline
--with-readline-ldflags="-lreadline"
--with-readline-cflags="-I/nowhere"
{% endblock %}
