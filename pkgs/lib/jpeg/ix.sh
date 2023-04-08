{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if x86_64 %}
lib/jpeg/{{libjpeg_ver or 'moz'}}
{% else %}
lib/jpeg/ijg
{% endif %}
{% endblock %}
