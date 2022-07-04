{% extends '//bin/elfutils/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--disable-debuginfod
--disable-libdebuginfod
{% endblock %}
