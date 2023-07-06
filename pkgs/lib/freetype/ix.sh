{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/harfbuzz/ft
lib/freetype/{{libfreetype_ver or 'ct'}}
{% endblock %}
