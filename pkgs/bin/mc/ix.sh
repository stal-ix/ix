{% extends '//die/hub.sh' %}

{% block run_deps %}
set/compress
{% if freebsd %}
bin/mc/curses/netbsd
{% else %}
bin/mc/slang
{% endif %}
{% endblock %}
