{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/sdl/{{libsdl_ver or '2'}}
{% endblock %}
