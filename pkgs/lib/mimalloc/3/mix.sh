{% extends '//lib/mimalloc/2/mix.sh' %}

{% block cpp_defines %}
{{super()}}
MI_STAT=0
{% endblock %}
