{% extends 'full/ix.sh' %}

{% block postinstall %}
{{super()}}
rm ${out}/share/gir-1.0/Harf*
rm ${out}/share/gir-1.0/Grap*
{% endblock %}
