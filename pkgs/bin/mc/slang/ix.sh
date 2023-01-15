{% extends '//bin/mc/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/slang
{% endblock %}

{% block configure_flags %}
{{super()}}
--with-screen=slang
{% endblock %}
