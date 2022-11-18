{% extends '//die/proxy.sh' %}

{% block bld_data %}
aux/adwaita/icons/scalable
{% endblock %}

{% block bld_tool %}
bld/scripts/iconker
{% endblock %}

{% block build %}
iconker "${ADWAITA_ICONS}/scalable" "${out}/share/icons/Adwaita"
{% endblock %}
