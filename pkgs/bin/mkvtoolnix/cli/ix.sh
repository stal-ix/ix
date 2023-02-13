{% extends '//bin/mkvtoolnix/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--disable-gui
{% endblock %}
