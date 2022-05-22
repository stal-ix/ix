{% extends '//bin/bash/5/t/ix.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-nls
--disable-readline
{% endblock %}
