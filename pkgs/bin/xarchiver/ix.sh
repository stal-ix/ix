{% extends '//die/hub.sh' %}

{% block run_deps %}
set/compress
bin/xarchiver/unwrap
bin/xdg/er(wrap=xarchiver)
{% endblock %}
