{% extends '//lib/sensors/t/ix.sh'  %}

{% block build_flags %}
{{super()}}
fix_shebangs
{% endblock %}
