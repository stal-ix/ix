{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/qt/6/multimedia/{{qt_multimedia_backend or 'ffmpeg'}}
{% endblock %}
