{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wget
bin/curl
bin/wmenu
bin/hikari
bin/convert
bin/unbound
set/box/gnu
set/compress
{% endblock %}
