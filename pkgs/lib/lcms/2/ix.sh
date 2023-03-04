{% extends 't/ix.sh' %}

{% block env %}
{{super()}}
export CPPFLAGS="-DCMS_NO_REGISTER_KEYWORD=1 \${CPPFLAGS}"
{% endblock %}
