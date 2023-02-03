{% extends '//bin/iwd/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/readline
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-dbus-policy
--disable-daemon
{% endblock %}
