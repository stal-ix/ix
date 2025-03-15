{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/xdg/open
bin/telegram/desktop/unwrap(allocator={{default_allocator}},ffmpeg_ver=6)
{% endblock %}
