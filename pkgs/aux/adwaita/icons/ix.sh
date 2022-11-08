{% extends '//aux/adwaita/theme/ix.sh' %}

{% block install %}
{{super()}}
rm -rf ${out}/share/icons/Adwaita/cursors
{% endblock %}

{% block env %}
export ADWAITA_ICONS=${out}/share/icons/Adwaita
{% endblock %}
