{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wget
bin/unbound
set/compress
set/box/gnu
{% endblock %}
