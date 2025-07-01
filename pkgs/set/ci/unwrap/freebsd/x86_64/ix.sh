{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/unbound
set/compress
sert/box/gnu
{% endblock %}
