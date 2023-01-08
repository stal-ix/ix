{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/mplayer/unwrap(ffmpeg_ver=4)
{% endblock %}
