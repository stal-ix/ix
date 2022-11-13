{% extends '//lib/rubber/band/t/ix.sh' %}

{% block bld_libs %}
lib/sndfile
{{super()}}
{% endblock %}
