{% extends '//bin/assemble/ix.sh' %}

{% block build_flags %}
{{super()}}
compress
{% endblock %}
