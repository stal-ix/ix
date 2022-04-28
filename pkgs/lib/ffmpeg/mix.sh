{% extends '//mix/hub.sh' %}

{% block lib_deps %}
lib/ffmpeg/{{ffmpeg_ver or '5'}}
{% endblock %}
