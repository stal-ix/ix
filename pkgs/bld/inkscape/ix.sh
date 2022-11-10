{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/inkscape(gtk_icons=aux/hicolor-icon-theme)
{% endblock %}
