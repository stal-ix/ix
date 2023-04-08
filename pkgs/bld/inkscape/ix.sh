{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/inkscape/unwrap(gtk_icons=aux/hicolor-icon-theme)
{% endblock %}
