{% extends '//bin/byacc/ix.sh' %}

{% block configure_flags %}
{{super()}}
--enable-btyacc
{% endblock %}
