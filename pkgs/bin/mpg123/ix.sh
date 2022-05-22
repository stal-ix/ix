{% extends '//lib/mpg123/t/ix.sh' %}

{% block bld_libs %}
lib/sndio
{{super()}}
{% endblock %}
