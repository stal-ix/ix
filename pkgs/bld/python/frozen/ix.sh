{% extends '//bin/python/frozen/unwrap/ix.sh' %}

{% block env %}
{{super()}}
export NATIVE_PYTHON=${out}/bin/python3
{% endblock %}
