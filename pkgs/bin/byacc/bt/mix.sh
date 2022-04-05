{% extends '//bin/byacc/mix.sh' %}

{% block configure_flags %}
{{super()}}
--enable-btyacc
{% endblock %}
