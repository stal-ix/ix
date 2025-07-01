{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/wget
bin/unbound
set/compress
sert/box/gnu
{% endblock %}
