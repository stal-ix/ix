{% extends '//lib/gdbm/t/mix.sh' %}

{% block bld_libs %}
lib/intl
lib/readline
{{super()}}
{% endblock %}

{% block bld_tool %}
bin/bison/3/8
{{super()}}
{% endblock %}

{% block configure_flags %}
--with-readline
{{super()}}
{% endblock %}
