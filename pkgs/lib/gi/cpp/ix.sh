{% extends 't/ix.sh' %}

{% block env %}
{{super()}}
export CPPFLAGS="-I${out}/include/cppgir -I${out}/include/cppgir/gi -I${out}/include/cppgir/override \${CPPFLAGS}"
{% endblock %}
