{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if luna %}
lib/lunasvg/gdk/dl
{% else %}
lib/rsvg/dl
{% endif %}
lib/drivers/3d
lib/mesa/gl/dl
lib/mesa/egl/dl
{% endblock %}
