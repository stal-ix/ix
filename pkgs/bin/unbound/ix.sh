{% extends 't/ix.sh' %}

{% block bld_libs %}
lib/hiredis
lib/ng/http/2
{{super()}}
{% endblock %}
