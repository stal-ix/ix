{% extends '//bin/assemble/ng/ix.sh' %}

{% block build_flags %}
{{super()}}
compress
{% endblock %}
