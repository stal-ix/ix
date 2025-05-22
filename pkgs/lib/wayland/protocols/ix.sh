{% extends 't/ix.sh' %}

{% block postinstall %}
{{super()}}
rm -rf ${out}/lib
{% endblock %}
