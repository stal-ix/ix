{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/date/{{libdate_ver or 'ix'}}
{% endblock %}
