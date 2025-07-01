{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wget
bin/unbound
set/box/gnu
set/compress
{% endblock %}
