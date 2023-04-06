{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/inkscape/unwrap(gtk_icons=aux/hicolor-icon-theme,cplpl_std=15)
{% endblock %}
