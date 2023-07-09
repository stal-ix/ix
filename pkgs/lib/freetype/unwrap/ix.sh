{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/freetype/unwrap/{{libfreetype_ver or 'ct'}}
{% endblock %}
