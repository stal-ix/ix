{% extends '//die/hub.sh' %}

{% block run_deps %}
set/compress
bin/xarchiver/unwrap
{% endblock %}
