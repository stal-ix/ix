{% extends '//lib/mpg123/t/mix.sh' %}

{% block bld_libs %}
lib/sndio
{{super()}}
{% endblock %}
