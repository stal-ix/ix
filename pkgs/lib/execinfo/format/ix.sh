{% extends '//lib/execinfo/fp/ix.sh' %}

{# formatting functions for standalone backtrace impl #}

{% block c_rename_symbol %}
{{super()}}
backtrace
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/include/stacktraverse.h
{% endblock %}
