{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/xdg/open
bin/telegram/desktop/extra
bin/telegram/desktop/unwrap(allocator=tcmalloc,ffmpeg_ver=5)
{% endblock %}
