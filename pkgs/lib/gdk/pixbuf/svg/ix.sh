{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/{{svg_loader or 'svgren/gdk'}}/dl
{% endblock %}
