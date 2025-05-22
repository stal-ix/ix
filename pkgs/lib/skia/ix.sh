{% extends '//die/hub.sh' %}

{% block lib_deps %}
{% if opengl %}
lib/skia/full
{% else %}
lib/skia/lite
{% endif %}
{% endblock %}
