{% extends '//lib/parted/t/ix.sh' %}

{% block bld_libs %}
lib/intl
lib/readline
{{super()}}
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-readline
{% endblock %}
