{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/xml/2/{{libxml_ver or 'latest'}}
{% endblock %}
