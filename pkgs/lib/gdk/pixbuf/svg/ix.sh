{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/{{svg_loader or 'lunasvg/gdk'}}/dl
{% endblock %}
