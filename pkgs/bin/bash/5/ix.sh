{% extends 't/ix.sh' %}

{% block bld_libs %}
lib/c
lib/intl
lib/curses
lib/readline
{{super()}}
{% endblock %}

{% block host_libs %}
{{super()}}
lib/c
{% endblock %}

{% block bld_tool %}
bld/bison
{{super()}}
{% endblock %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-installed-readline
--enable-readline
--with-curses
{% endblock %}

{% block setup_target_flags %}
export bash_cv_func_strtoimax=y
{{super()}}
{% endblock %}
