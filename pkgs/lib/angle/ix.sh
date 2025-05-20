{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/angle/{{libangle_ver or 'chromium'}}
{% endblock %}
