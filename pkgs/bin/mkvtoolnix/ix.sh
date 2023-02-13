{% extends 't/ix.sh' %}

{% block configure_flags %}
{{super()}}
--disable-gui
{% endblock %}
